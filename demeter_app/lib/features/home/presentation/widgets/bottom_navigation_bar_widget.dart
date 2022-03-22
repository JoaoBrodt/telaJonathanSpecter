import 'package:demeter_app/core/navigation/screens_enum.dart';
import 'package:demeter_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:demeter_app/features/home/presentation/cubit/home_state.dart';
import 'package:demeter_design_system/demeter_design_system.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: getProportionateScreenWidth(AdaptativeTheme.mediumSpace)),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            spreadRadius: 5,
          )
        ],
        gradient: LinearGradient(
          colors: [
            const Color(0xFF364976),
            const Color(0xFF212E49),
            Theme.of(context).colorScheme.secondary
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0.1, 0.8, 1],
          tileMode: TileMode.clamp,
        ),
      ),
      child: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
        return BottomNavigationBar(
          iconSize: 30,
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.white70,
          selectedItemColor: Colors.white,
          selectedIconTheme: const IconThemeData(
            color: Colors.white,
            size: 30,
          ),
          currentIndex: state.screen.index,
          onTap: (index) =>
              context.read<HomeCubit>().changeScreen(Screens.values[index]),
          items: [
            BottomNavigationBarItem(
              label: AppLocalizations.of(context)!.dashboardScreen,
              icon: SvgPicture.asset("icons/dashboard.svg"),
            ),
            BottomNavigationBarItem(
              label: AppLocalizations.of(context)!.rhScreen,
              icon: SvgPicture.asset("icons/hr.svg"),
            ),
            BottomNavigationBarItem(
              label: AppLocalizations.of(context)!.refundScreen,
              icon: SvgPicture.asset("icons/refund.svg"),
            ),
            BottomNavigationBarItem(
              label: AppLocalizations.of(context)!.historicScreen,
              icon: SvgPicture.asset("icons/clock.svg"),
            ),
            BottomNavigationBarItem(
              label: AppLocalizations.of(context)!.moreScreen,
              icon: SvgPicture.asset("icons/more.svg"),
            ),
          ],
        );
      }),
    );
  }
}
