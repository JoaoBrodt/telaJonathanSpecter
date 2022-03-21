import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
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
          if (kIsWeb) {
            return MaterialPageRoute(
              settings: routeSettings,
              builder: (context) => routes[routeSettings.name]!(context),
            );
          }
          return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
            return routes[routeSettings.name]!(context);
          }, transitionsBuilder: (context, animation, anotherAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.0, 0.5),
                end: const Offset(0.0, 0),
              ).animate(animation),
              child: FadeTransition(opacity: animation, child: child),
            );
          });
        },
      ),
    );
  }
}
