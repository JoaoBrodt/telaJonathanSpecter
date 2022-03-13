import 'package:demeter_app/core/export.dart';
import 'package:demeter_app/core/navigation/pages_enum.dart';
import 'package:demeter_app/features/home/presentation/cubit/export.dart';
import 'package:demeter_app/features/home/presentation/widgets/export.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:demeter_app/features/dashboard/export.dart';
import 'package:demeter_app/features/more/presentation/more_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static final _navigatorKeys = {
    Pages.dashboard: GlobalKey<NavigatorState>(),
    Pages.customer: GlobalKey<NavigatorState>(),
    Pages.vehicle: GlobalKey<NavigatorState>(),
    Pages.more: GlobalKey<NavigatorState>()
  };

  Map<String, dynamic Function(BuildContext)> get moreRoutes =>
      {'/more': (context) => const MoreScreen()};
  Map<String, dynamic Function(BuildContext)> get dashboardRoutes => {
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

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(const HomeState()),
      child: Scaffold(
          appBar: kIsWeb ? AppBar() : null,
          drawer: kIsWeb ? const DrawerNavigator() : null,
          body: BlocConsumer<HomeCubit, HomeState>(
              listener: (context, state) {},
              builder: (context, state) {
                return IndexedStack(
                  index: state.pageIndex,
                  children: [
                    NavigatorPage(
                      navigatorKey: _navigatorKeys[Pages.dashboard]!,
                      routes: dashboardRoutes,
                    ),
                    Container(
                      color: Colors.red,
                    ),
                    Container(
                      color: Colors.blue,
                    ),
                    NavigatorPage(
                      navigatorKey: _navigatorKeys[Pages.more]!,
                      routes: moreRoutes,
                    ),
                  ],
                );
              }),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar:
              !kIsWeb ? const BottomNavigationBarWidget() : null),
    );
  }
}
