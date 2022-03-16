import 'package:demeter_app/core/app_assets.dart';
import 'package:demeter_app/features/dashboard/presentation/widgets/dashboard_body_option_widget.dart';
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
          Padding(
            padding: EdgeInsets.fromLTRB(
              getProportionateScreenWidth(AdaptativeTheme.defaultSpace),
              getProportionateScreenWidth(AdaptativeTheme.extraSpace),
              getProportionateScreenWidth(AdaptativeTheme.defaultSpace),
              getProportionateScreenWidth(AdaptativeTheme.minimunSpace),
            ),
            child: LargeTitleWidget(
                text: AppLocalizations.of(context)!.dashboardLastRefunds),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding:
                  const EdgeInsets.only(bottom: AdaptativeTheme.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DashboardBodyOptionWidget(
                    title: AppLocalizations.of(context)!.dashboardApproved,
                    icon: AppAssets.approved,
                  ),
                  DashboardBodyOptionWidget(
                    title: AppLocalizations.of(context)!.dashboardRepproved,
                    icon: AppAssets.repproved,
                  ),
                  DashboardBodyOptionWidget(
                    title: AppLocalizations.of(context)!.dashboardWaiting,
                    icon: AppAssets.waiting,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
