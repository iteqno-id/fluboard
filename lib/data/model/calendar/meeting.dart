import 'dart:ui';

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay,
      {this.isTask = false, this.isDone = false});

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
  bool isTask;
  bool isDone;
}
