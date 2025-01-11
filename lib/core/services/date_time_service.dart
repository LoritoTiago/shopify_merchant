import 'package:intl/intl.dart';

class DateTimeService {
  static String toWeekday({required DateTime date}) {
    String formattedDate = DateFormat('EEEE, dd MMMM yyyy').format(date);

    return formattedDate;
  }
}
