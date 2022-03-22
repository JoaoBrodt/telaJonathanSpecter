import 'package:demeter_app/core/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'demeter_app.dart';

void main() {
  F.appFlavor = Flavor.DEV;
  WidgetsFlutterBinding.ensureInitialized();
  Inject.initialize();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const DemeterApp());
}
