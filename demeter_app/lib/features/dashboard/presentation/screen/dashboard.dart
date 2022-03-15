import 'package:demeter_app/core/app_assets.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            HelloWidget(
              name: 'Júlia',
              description:
                  AppLocalizations.of(context)!.dashboardHelloDescription,
              image: AppAssets.avatar,
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: getProportionateScreenWidth(
                      AdaptativeTheme.defaultSpace)),
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
          ],
        ),
      ),
    );
  }
}
