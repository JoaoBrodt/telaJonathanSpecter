import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  static String get environment => _get('environment');

  static String _get(String name) => dotenv.env[name] ?? '';
  static int _getInt(String name) => int.parse(dotenv.env[name] ?? '0');
  static bool _getBool(String name) =>
      (DotEnv().env[name] ?? 'false').toLowerCase() == 'true';
}
