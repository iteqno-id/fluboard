import 'package:flutter/material.dart';
import 'package:googleapis/calendar/v3.dart' as calendar;

class EventParcel {
  EventParcel({required this.event, this.color = Colors.blue});

  calendar.Event event;
  Color color;
}
