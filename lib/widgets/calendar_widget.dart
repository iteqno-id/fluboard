import 'dart:async';

import 'package:fluboard/constants/app_config.dart';
import 'package:fluboard/data/model/calendar/meeting.dart';
import 'package:fluboard/data/model/calendar/meeting_data_source.dart';
import 'package:fluboard/data/model/common/event_parcel.dart';
import 'package:fluboard/data/model/common/result_state.dart';
import 'package:fluboard/data/provider/calendar_event_provider.dart';
import 'package:fluboard/data/repository/app_repository.dart';
import 'package:fluboard/di/injector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  final repo = getIt<AppRepository>();
  late Timer timer;

  @override
  void initState() {
    tick();
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CalendarEventProvider>(
      builder: (BuildContext context, provider, _) {
        if (provider.state == ResultState.loading) {
          return const Center(child: CupertinoActivityIndicator());
        } else if (provider.state == ResultState.hasData || provider.state == ResultState.noData) {
          return SfCalendar(
            backgroundColor: Colors.black,
            view: CalendarView.month,
            firstDayOfWeek: 1,
            todayHighlightColor: Colors.red,
            todayTextStyle: const TextStyle(fontSize: 32),
            headerStyle: const CalendarHeaderStyle(textAlign: TextAlign.center),
            monthViewSettings: const MonthViewSettings(
              dayFormat: "EEE",
              appointmentDisplayCount: 3,
              monthCellStyle: MonthCellStyle(
                textStyle: TextStyle(fontSize: 32),
              ),
              showAgenda: false,
              appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
            ),
            blackoutDates: _stylingWeekend(),
            blackoutDatesTextStyle: TextStyle(
              color: Colors.red.shade300,
              fontSize: 32,
            ),
            dataSource: MeetingDataSource(_getDataSource(provider.events)),
          );
        } else {
          return const Center(child: Text('Cannot load calender'));
        }
      },
    );
  }

  List<Meeting> _getDataSource(List<EventParcel> events) {
    final List<Meeting> meetings = <Meeting>[];
    var meetingList = events
        .map((e) => Meeting(
              "${e.event.summary}",
              e.event.start?.date ?? e.event.start!.dateTime!,
              e.event.end?.date?.subtract(const Duration(seconds: 1)) ??
                  e.event.end!.dateTime!.subtract(const Duration(seconds: 1)),
              e.color,
              true,
            ))
        .toList();
    meetings.addAll(meetingList);
    return meetings;
  }

  List<DateTime> _stylingWeekend() {
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

  tick() {
    timer = Timer.periodic(
        Duration(
          minutes: repo.getConfig(AppConfig.calendarDoc, AppConfig.calendarRefresh),
        ), (timer) {
      Provider.of<CalendarEventProvider>(context, listen: false).refreshCalendar();
    });
  }
}
