import 'package:intl/intl.dart';

class DataUtils {
  DataUtils._();

  static String getCurrentDate() {
    return DateFormat.yMMMd().format(DateTime.now());
  }
}