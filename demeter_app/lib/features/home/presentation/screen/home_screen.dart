import 'package:demeter_app/core/export.dart';
import 'package:demeter_app/core/navigation/pages_enum.dart';
import 'package:demeter_app/features/home/presentation/cubit/export.dart';
import 'package:demeter_app/features/home/presentation/widgets/export.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static final _navigatorKeys = {
    Screens.dashboard: GlobalKey<NavigatorState>(),
    Screens.rh: GlobalKey<NavigatorState>(),
    Screens.refund: GlobalKey<NavigatorState>(),
    Screens.more: GlobalKey<NavigatorState>()
  };

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                  index: state.screen.index,
                  children: [
                    NavigatorPage(
                      navigatorKey:
                          HomeScreen._navigatorKeys[Screens.dashboard]!,
                      routes: Routes.dashboard,
                    ),
                    NavigatorPage(
                      navigatorKey: HomeScreen._navigatorKeys[Screens.rh]!,
                      routes: Routes.rh,
                    ),
                    NavigatorPage(
                      navigatorKey: HomeScreen._navigatorKeys[Screens.refund]!,
                      routes: Routes.refund,
                    ),
                    NavigatorPage(
                      navigatorKey: HomeScreen._navigatorKeys[Screens.more]!,
                      routes: Routes.more,
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
