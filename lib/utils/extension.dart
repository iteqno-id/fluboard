import 'package:fluboard/utils/calendar_color.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String asHHMM() => DateFormat('HH:mm').format(this);
  String ashmm() => DateFormat('h:mm').format(this);
  String asAmPm() => DateFormat('a').format(this);
  String asSecond() => DateFormat('ss').format(this);
  String asDateMonthYear() => DateFormat('d MMMM yyyy').format(this);
  String asDay() => DateFormat('EEEE').format(this);
  String asDayShort() => DateFormat('EEE').format(this);
}

extension PluralizeExtension on int {
  String pluralize(String unit) {
    if (this > 1) {
      if (unit.substring(unit.length) == 's') {
        unit = "${unit}es";
      } else {
        unit = "${unit}s";
      }
    }
    return "${this} ${Intl.plural(this, other: unit, one: unit, many: unit)}";
  }
}

extension ConverterExtension on dynamic {
  String asKmph() => (double.parse("${this}") * 3.6).toStringAsFixed(2);
}

extension StringExtension on String? {
  Color toColor() => this == null ? Colors.blue : CalendarColor.colors[int.parse(this!)];
}
