import 'package:intl/intl.dart';

class DateUtil {
  // eg 30 Nov 2022
  static final DateFormat _dFMonthShortDate = DateFormat('dd MMM yyyy');
  // eg 30 November 2022
  static final DateFormat _dFDefaultDate = DateFormat('dd MMMM yyyy');

  static String formatMonthShortDate(DateTime d) => _dFMonthShortDate.format(d);
  static String formatDefaultDate(DateTime d) => _dFDefaultDate.format(d);
}
