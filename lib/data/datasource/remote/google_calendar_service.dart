import 'package:fluboard/data/datasource/remote/authenticated_client.dart';
import 'package:googleapis/calendar/v3.dart';

class GoogleCalendarService {
  CalendarApi get service => CalendarApi(AuthenticatedClient());

  Future<CalendarList> getCalendars() async => await service.calendarList.list();
  Future<Calendar> getCalendarItems(String calendarId) async =>
      await service.calendars.get(calendarId);
  Future<Events> getEvents(String calendarId, DateTime timeMin, DateTime timeMax) async =>
      await service.events.list(calendarId, timeMin: timeMin, timeMax: timeMax);
}
