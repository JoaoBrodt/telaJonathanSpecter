import 'package:demeter_app/core/app_assets.dart';
import 'package:demeter_app/features/home/presentation/cubit/export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrawerNavigator extends StatelessWidget {
  const DrawerNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
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
                  const Color(0xFF1b1b34),
                  Theme.of(context).colorScheme.secondary
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.0, 1],
                tileMode: TileMode.mirror,
              ),
            ),
            child: Column(
              children: [
                CircleAvatar(
                  maxRadius: 30,
                  minRadius: 20,
                  backgroundColor: Colors.white60,
                  child: ClipOval(child: AppAssets.avatar),
                ),
                Text(
                  "Olá, Julia!",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  "Útimos reembols 10 aprovados 2 reprovados",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
          ),
          ListTile(
            leading: SvgPicture.asset("icons/dashboard.svg"),
            title: Text(AppLocalizations.of(context)!.dashboardScreen),
            onTap: context.read<HomeCubit>().dashboardScreen,
          ),
          ListTile(
            leading: SvgPicture.asset("icons/hr.svg"),
            title: Text(AppLocalizations.of(context)!.rhScreen),
            onTap: context.read<HomeCubit>().rhScreen,
          ),
          ListTile(
            leading: SvgPicture.asset("icons/refund.svg"),
            title: Text(AppLocalizations.of(context)!.refundScreen),
            onTap: context.read<HomeCubit>().refundScreen,
          ),
          ListTile(
            leading: SvgPicture.asset("icons/clock.svg"),
            title: Text(AppLocalizations.of(context)!.historicScreen),
            onTap: context.read<HomeCubit>().historicScreen,
          ),
          ListTile(
            leading: SvgPicture.asset("icons/more.svg"),
            title: Text(AppLocalizations.of(context)!.moreScreen),
            onTap: context.read<HomeCubit>().moreScreen,
          ),
        ],
      ),
    );
  }
}
