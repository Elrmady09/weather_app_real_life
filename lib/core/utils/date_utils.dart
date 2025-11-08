
import 'package:intl/intl.dart';

class DateUtils {
  static String formatDate(DateTime dt) {
    return DateFormat('dd MMM yyyy').format(dt);
  }
}