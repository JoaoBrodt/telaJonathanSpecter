import 'package:demeter_design_system/adaptative_theme.dart';
import 'package:demeter_app/features/dashboard/presentation/screen/dashboard.dart';
import 'package:demeter_app/features/more/exports.dart';
import 'package:demeter_design_system/demeter_design_system.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, dynamic Function(BuildContext)> get dashboard => {
        '/dashboard': (context) => const DashBoardScreen(),
        '/dashboard/example_navigation': (context) => Scaffold(
              appBar: const AppBarWidget(
                  title: 'Exemplo de navegação', shadows: false),
              body: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(
                    horizontal: AdaptativeTheme.defaultSpace),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: ButtonLargeLeftIconWidget(
                        text: 'Voltar Dashboard',
                        icon: const Icon(Icons.keyboard_arrow_left, size: 30),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    const SizedBox(width: 30),
                    Flexible(
                      child: ButtonLargeLeftIconWidget(
                        text: 'Other Navigation',
                        icon: const Icon(Icons.keyboard_double_arrow_left,
                            size: 30),
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true)
                              .pushReplacementNamed('/teste');
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
      };

  static Map<String, dynamic Function(BuildContext)> get rh => {
        '/rh': (context) => Container(
              color: Colors.red,
            )
      };

  static Map<String, dynamic Function(BuildContext)> get refund => {
        '/refund': (context) => Container(
              color: Colors.blue,
            )
      };

  static Map<String, dynamic Function(BuildContext)> get more =>
      {'/more': (context) => const MoreScreen()};
}
