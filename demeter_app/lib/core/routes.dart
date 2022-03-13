import 'package:demeter_app/features/dashboard/presentation/screen/dashboard.dart';
import 'package:demeter_app/features/more/exports.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, dynamic Function(BuildContext)> get dashboard => {
        '/dashboard': (context) => const DashBoardScreen(),
        '/dashboard/example_navigation': (context) => Scaffold(
              appBar: AppBar(
                title: Text("Example Navigation"),
              ),
              body: const Center(
                child: Text("Example Navigation"),
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
