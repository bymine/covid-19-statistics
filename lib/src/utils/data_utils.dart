import 'package:intl/intl.dart';

class DataUtils {
  static String formatCountNumber(int value) {
    return NumberFormat("###,###,###,###").format(value);
  }

  static String formatChartDateTime(String date) {
    return DateFormat('M.d').format(DateTime.parse(date));
  }

  static String formatStateDate(DateTime date) {
    return DateFormat('yyyyMMdd').format(date);
  }
}
