import 'package:demeter_app/features/home/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:demeter_app/core/export.dart';

class DemeterApp extends StatelessWidget {
  const DemeterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)!.appName,
      initialRoute: "/home",
      theme: themeLight,
      darkTheme: themeDark,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en'), Locale('pt')],
      routes: {
        Routes.HOME: (context) => const HomeScreen(),
      },
    );
  }
}
