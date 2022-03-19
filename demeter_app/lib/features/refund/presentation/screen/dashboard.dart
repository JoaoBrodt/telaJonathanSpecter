import 'package:demeter_app/core/app_assets.dart';
import 'package:demeter_app/features/refund/presentation/bloc/search/refund_search_bloc.dart';
import 'package:demeter_app/features/refund/presentation/bloc/search/refund_search_state.dart';
import 'package:demeter_app/features/refund/presentation/dtos/refund_dto.dart';
import 'package:demeter_app/features/refund/presentation/widgets/dashboard_body_option_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:demeter_design_system/demeter_design_system.dart';
import 'package:flutter/material.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
          title: AppLocalizations.of(context)!.dashboardScreen, shadows: false),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HelloWidget(
            name: 'Júlia',
            description:
                AppLocalizations.of(context)!.dashboardHelloDescription,
            image: AppAssets.avatar,
          ),
          Container(
            margin: const EdgeInsets.only(bottom: AdaptativeTheme.minimunSpace),
            padding: EdgeInsets.symmetric(
              horizontal:
                  getProportionateScreenWidth(AdaptativeTheme.defaultSpace),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: ButtonLargeLeftIconWidget(
                    text: AppLocalizations.of(context)!.requestRefund,
                    icon: const Icon(Icons.add_circle, size: 30),
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed('/dashboard/example_navigation');
                    },
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(16),
                ),
                Flexible(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(minHeight: 62),
                    child: ButtonLargeLeftIconWidget(
                      text: AppLocalizations.of(context)!.seeHistory,
                      icon: const Icon(Icons.timelapse_rounded, size: 30),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    getProportionateScreenWidth(AdaptativeTheme.defaultSpace),
                    getProportionateScreenWidth(AdaptativeTheme.minimunSpace),
                    getProportionateScreenWidth(AdaptativeTheme.defaultSpace),
                    getProportionateScreenWidth(AdaptativeTheme.smallSpace),
                  ),
                  child: LargeTitleWidget(
                      text: AppLocalizations.of(context)!.dashboardLastRefunds),
                ),
                BlocConsumer<RefundSearchBloc, RefundSearchState>(
                    buildWhen: (previous, current) =>
                        current is RefundSearchSuccessState ||
                        current is RefundSearchLoadingState,
                    listener: (context, state) {},
                    builder: (context, state) {
                      var refunds = <RefundDto>[];
                      var isLoading = false;
                      if (state is RefundSearchInitialState) {
                        return Container();
                      }
                      if (state is RefundSearchSuccessState) {
                        refunds = state.refunds;
                      } else if (state is RefundSearchLoadingState) {
                        isLoading = true;
                      }

                      return DashboardBodyOptionWidget(
                        title: AppLocalizations.of(context)!.dashboardApproved,
                        icon: AppAssets.approved,
                        isLoading: isLoading,
                        refunds: refunds,
                      );
                    }),
                BlocConsumer<RefundSearchBloc, RefundSearchState>(
                    buildWhen: (previous, current) =>
                        current is RefundSearchPedingLoadingState ||
                        current is RefundSearchPedingSuccessState,
                    listener: (context, state) {},
                    builder: (context, state) {
                      var refunds = <RefundDto>[];
                      var isLoading = false;
                      if (state is RefundSearchInitialState) {
                        return Container();
                      }
                      if (state is RefundSearchPedingSuccessState) {
                        refunds = state.refunds;
                      } else if (state is RefundSearchPedingLoadingState) {
                        isLoading = true;
                      }

                      return DashboardBodyOptionWidget(
                        title: AppLocalizations.of(context)!.dashboardWaiting,
                        icon: AppAssets.repproved,
                        isLoading: isLoading,
                        refunds: refunds,
                      );
                    }),
                DashboardBodyOptionWidget(
                  title: AppLocalizations.of(context)!.dashboardRepproved,
                  icon: AppAssets.waiting,
                  isLoading: false,
                  refunds: [],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
