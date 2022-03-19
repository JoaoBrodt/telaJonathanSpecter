import 'package:demeter_app/core/inject/inject.dart';
import 'package:flutter/material.dart';
import 'package:demeter_app/app.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Inject.initialize();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const DemeterApp());
}
