import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      backgroundColor: Colors.black,
      view: CalendarView.month,
      firstDayOfWeek: 1,
      todayHighlightColor: Colors.red,
      todayTextStyle: const TextStyle(fontSize: 32),
      headerStyle: const CalendarHeaderStyle(textAlign: TextAlign.center),
      monthViewSettings: const MonthViewSettings(
        dayFormat: "EEE",
        numberOfWeeksInView: 5,
        monthCellStyle: MonthCellStyle(
          textStyle: TextStyle(fontSize: 32),
        ),
      ),
      blackoutDates: _getWeekend(),
      blackoutDatesTextStyle: TextStyle(
        color: Colors.red.shade300,
        fontSize: 32,
      ),
    );
  }

  List<DateTime> _getWeekend() {
    DateTime firsDate = DateTime(DateTime.now().year, DateTime.now().month, 1);
    DateTime lastDay = DateTime(DateTime.now().year, DateTime.now().month + 1, 0);
    final daysToGenerate = lastDay.difference(firsDate).inDays + 1;
    List<DateTime> weekend = [];
    List.generate(daysToGenerate, (i) {
      DateTime newDate = DateTime(firsDate.year, firsDate.month, firsDate.day + (i));
      if (newDate.weekday >= 6 && newDate.day != DateTime.now().day) {
        weekend.add(newDate);
      }
    });
    return weekend;
  }
}
