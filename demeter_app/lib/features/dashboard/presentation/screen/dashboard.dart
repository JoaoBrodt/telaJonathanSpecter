import 'package:demeter_app/core/presentation/theme/adaptative_theme.dart';
import 'package:demeter_design_system/sized_config.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:demeter_design_system/demeter_design_system.dart';
import 'package:flutter/material.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
          getProportionateScreenWidth(AdaptativeTheme.defaultSpace)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: ButtonLargeLeftIconWidget(
              text: AppLocalizations.of(context)!.requestRefund,
              icon:
                  Icon(Icons.add_circle, size: getProportionateScreenWidth(30)),
              onPressed: () {
                Navigator.of(context)
                    .pushNamed('/dashboard/example_navigation');
              },
            ),
          ),
          SizedBox(
            width: getProportionateScreenWidth(AdaptativeTheme.defaultSpace),
          ),
          Flexible(
            child: ButtonLargeLeftIconWidget(
              text: AppLocalizations.of(context)!.seeHistory,
              icon: Icon(Icons.timelapse_rounded,
                  size: getProportionateScreenWidth(30)),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
