import 'package:fluboard/data/model/common/event_parcel.dart';
import 'package:fluboard/data/model/common/result_state.dart';
import 'package:fluboard/data/repository/app_repository.dart';
import 'package:fluboard/di/injector.dart';
import 'package:fluboard/utils/calendar_color.dart';
import 'package:fluboard/utils/extension.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:googleapis/calendar/v3.dart';

class CalendarEventProvider extends ChangeNotifier {
  final repository = getIt<AppRepository>();

  late ResultState _state;
  late String _message;
  late List<EventParcel> _events;

  ResultState get state => _state;
  String get message => _message;
  List<EventParcel> get events => _events;

  CalendarEventProvider() {
    _getEvents();
  }

  Future<dynamic> refreshCalendar() => _getEvents();

  Future<dynamic> _getEvents() async {
    _state = ResultState.loading;
    notifyListeners();

    _events = [];

    DateTime dateMin =
        DateTime(DateTime.now().year, DateTime.now().month, 1).subtract(const Duration(days: 7));
    DateTime dateMax =
        DateTime(DateTime.now().year, DateTime.now().month + 1, 0).add(const Duration(days: 7));
    try {
      final calendars = await repository.getCalendars();

      calendars.items?.forEach((element) async {
        final result = await repository.getEvents("${element.id}", dateMin, dateMax);
        _state = ResultState.hasData;
        var parcel = result.items
            ?.map((e) => EventParcel(event: e, color: element.colorId.toColor()))
            .toList();
        _events.addAll(parcel ?? []);
        notifyListeners();
      });

      final taskLists = await repository.getTaskLists();
      taskLists.items?.forEach((element) async {
        final tasks = await repository.getTasks("${element.id}");
        tasks.items?.forEach((e) {
          if (e.due != null) {
            var parcel = EventParcel(
              event: Event(
                start: EventDateTime(date: DateTime.parse("${e.completed ?? e.due}")),
                end: EventDateTime(
                    date:
                        DateTime.parse("${e.completed ?? e.due}").add(const Duration(seconds: 1))),
                summary: e.title,
              ),
              color: CalendarColor.colors[20],
              isTask: true,
              isDone: e.hidden ?? false,
            );
            _events.add(parcel);
          }
        });
        _state = ResultState.hasData;
        notifyListeners();
      });

      if (_events.isEmpty) {
        _state = ResultState.noData;
        _events = [];
        notifyListeners();
      }
    } on ApiRequestError catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = "${e.message}";
    }
  }
}
