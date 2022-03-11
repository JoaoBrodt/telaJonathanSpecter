import 'package:demeter_app/core/export.dart';
import 'package:demeter_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:demeter_app/features/home/presentation/cubit/home_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: AdaptativeTheme.minimunExtraSpace),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            spreadRadius: 5,
          )
        ],
        gradient: const LinearGradient(
          colors: [Color(0xFF1b1b34), Color(0xFF2e3e66)],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          stops: [0.0, 1],
          tileMode: TileMode.mirror,
        ),
      ),
      child: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
        return BottomNavigationBar(
          iconSize: 30,
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.white70,
          selectedItemColor: Colors.white,
          selectedIconTheme: const IconThemeData(
            color: Colors.white,
            size: 30,
          ),
          currentIndex: state.pageIndex,
          onTap: (index) => context.read<HomeCubit>().changeIndex(index),
          items: [
            BottomNavigationBarItem(
              label: AppLocalizations.of(context)!.dashboardScreen,
              icon: const Icon(Icons.dashboard),
            ),
            BottomNavigationBarItem(
              label: AppLocalizations.of(context)!.rhScreen,
              icon: const Icon(Icons.people),
            ),
            BottomNavigationBarItem(
              label: AppLocalizations.of(context)!.refundScreen,
              icon: const Icon(Icons.monetization_on),
            ),
            BottomNavigationBarItem(
              label: AppLocalizations.of(context)!.moreScreen,
              icon: const Icon(CupertinoIcons.ellipsis),
            ),
          ],
        );
      }),
    );
  }
}
