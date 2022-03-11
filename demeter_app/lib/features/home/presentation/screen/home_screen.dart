import 'package:demeter_app/features/home/presentation/cubit/export.dart';
import 'package:demeter_app/features/home/presentation/widgets/export.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:demeter_app/features/dashboard/export.dart';
import 'package:demeter_app/features/more/presentation/more_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
                    const DashBoardScreen(),
                    Container(
                      color: Colors.red,
                    ),
                    Container(
                      color: Colors.blue,
                    ),
                    const MoreScreen(),
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
