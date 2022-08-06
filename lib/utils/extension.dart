import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String asHHMM() => DateFormat('HH:mm').format(this);
  String asSecond() => DateFormat('ss').format(this);
  String asDateMonthYear() => DateFormat('d MMMM yyyy').format(this);
  String asDay() => DateFormat('EEEE').format(this);
  String asDayShort() => DateFormat('EEE').format(this);
}

extension ConverterExtension on dynamic {
  String asKmph() => (double.parse("${this}") * 3.6).toStringAsFixed(2);
}
