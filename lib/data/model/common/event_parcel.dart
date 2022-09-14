import 'package:flutter/material.dart';
import 'package:googleapis/calendar/v3.dart' as calendar;

class EventParcel {
  EventParcel({
    required this.event,
    this.color = Colors.blue,
    this.isTask = false,
    this.isDone = false,
  });

  calendar.Event event;
  Color color;
  bool isTask;
  bool isDone;
}
