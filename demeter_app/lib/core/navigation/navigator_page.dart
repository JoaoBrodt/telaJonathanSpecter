import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigatorPage extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final Map<String, Function(BuildContext context)> routes;
  const NavigatorPage(
      {Key? key, required this.navigatorKey, required this.routes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>
          await navigatorKey.currentState?.maybePop() ?? false,
      child: Navigator(
        key: navigatorKey,
        initialRoute: routes.keys.first,
        onGenerateRoute: (routeSettings) {
          if (!routes.containsKey(routeSettings.name)) {
            return null;
          }
          return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
            return routes[routeSettings.name]!(context);
          }, transitionsBuilder: (context, animation, anotherAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          });
        },
      ),
    );
  }
}
