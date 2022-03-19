import 'package:demeter_app/features/refund/presentation/bloc/export.dart';
import 'package:demeter_app/features/refund/presentation/dtos/refund_dto.dart';
import 'package:demeter_app/features/refund/presentation/widgets/dashboard_body_options_item_shimmer_widget.dart';
import 'package:demeter_app/features/refund/presentation/widgets/dashboard_body_options_item_widget.dart';
import 'package:demeter_design_system/demeter_design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardBodyOptionWidget extends StatelessWidget {
  final String title;
  final Widget icon;
  final bool isLoading;
  final List<RefundDto> refunds;
  const DashboardBodyOptionWidget({
    Key? key,
    required this.title,
    required this.icon,
    this.isLoading = false,
    required this.refunds,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(
            getProportionateScreenWidth(AdaptativeTheme.defaultSpace),
            AdaptativeTheme.minimunSpace,
            getProportionateScreenWidth(AdaptativeTheme.defaultSpace),
            getProportionateScreenWidth(AdaptativeTheme.minimunSpace),
          ),
          child: MediumTitleWidget(text: title, icon: icon),
        ),
        Builder(builder: (context) {
          if (isLoading) {
            return SizedBox(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: getProportionateScreenWidth(
                          AdaptativeTheme.defaultSpace),
                      right: getProportionateScreenWidth(
                          AdaptativeTheme.mediumSpace),
                    ),
                    child: const DashboardBodyOptionItemShimmerWidget(),
                  ),
                  const DashboardBodyOptionItemShimmerWidget(),
                ],
              ),
            );
          }
          if (!isLoading && refunds.isNotEmpty) {
            return SizedBox(
              height: 180,
              child: ListView.builder(
                itemCount: refunds.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: index == 0
                          ? getProportionateScreenWidth(
                              AdaptativeTheme.smallSpace)
                          : 0,
                    ),
                    child: DashboardOptionItemWidget(
                      refund: refunds[index],
                    ),
                  );
                },
              ),
            );
          }
          return Container();
        }),
      ],
    );
  }
}
