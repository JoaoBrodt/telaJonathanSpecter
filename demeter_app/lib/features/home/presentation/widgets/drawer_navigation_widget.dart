import 'package:demeter_app/core/app_assets.dart';
import 'package:demeter_app/features/home/presentation/cubit/export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
              gradient: const LinearGradient(
                colors: [Color(0xFF1b1b34), Color(0xFF2e3e66)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 1],
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
            leading: const Icon(Icons.dashboard),
            title: Text(AppLocalizations.of(context)!.dashboardScreen),
            onTap: context.read<HomeCubit>().dashboardScreen,
          ),
          ListTile(
            leading: const Icon(Icons.people),
            title: Text(AppLocalizations.of(context)!.rhScreen),
            onTap: context.read<HomeCubit>().rhScreen,
          ),
          ListTile(
            leading: const Icon(Icons.monetization_on),
            title: Text(AppLocalizations.of(context)!.refundScreen),
            onTap: context.read<HomeCubit>().refundScreen,
          ),
          ListTile(
            leading: const Icon(CupertinoIcons.ellipsis),
            title: Text(AppLocalizations.of(context)!.moreScreen),
            onTap: context.read<HomeCubit>().moreScreen,
          ),
        ],
      ),
    );
  }
}
