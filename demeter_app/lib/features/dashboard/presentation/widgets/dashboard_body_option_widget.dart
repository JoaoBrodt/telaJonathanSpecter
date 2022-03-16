import 'package:demeter_design_system/demeter_design_system.dart';
import 'package:flutter/material.dart';

class DashboardBodyOptionWidget extends StatelessWidget {
  final String title;

  final Widget icon;
  const DashboardBodyOptionWidget(
      {Key? key, required this.title, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(
            getProportionateScreenWidth(AdaptativeTheme.defaultSpace),
            AdaptativeTheme.extraSpace,
            getProportionateScreenWidth(AdaptativeTheme.defaultSpace),
            getProportionateScreenWidth(AdaptativeTheme.minimunSpace),
          ),
          child: MediumTitleWidget(text: title, icon: icon),
        ),
        const RefundShimmerWidget(),
      ],
    );
  }
}
