import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String asHHMM() => DateFormat('HH:mm').format(this);
  String asSecond() => DateFormat('ss').format(this);
  String asDateMonthYear() => DateFormat('d MMMM yyyy').format(this);
  String asDay() => DateFormat('EEEE').format(this);
}
