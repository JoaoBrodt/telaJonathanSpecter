import 'package:intl/intl.dart';

class DateWorker {
  static DateFormat parser() {
    return DateFormat("yyyy-MM-ddTHH:mm:ss");
  }

  static DateFormat formmatter() {
    return DateFormat("dd/MM/yy");
  }
}
