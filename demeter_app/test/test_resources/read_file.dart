import 'dart:io';

class FileJson {
  static String read({required path}) {
    return File('test/test_resources/$path').readAsStringSync();
  }
}
