import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static const String openWeatherApiDomain = "api.openweathermap.org";
  static const String openWeatherIconUrl = "https://openweathermap.org/img/wn/";
  static const String units = "metric"; //metric, imperial
  static const int photoRefresh = 30; //seconds
  static const int currentWeatherRefresh = 30; //minutes
  static const int forecastRefresh = 1; //hours
  static const int calendarRefresh = 30; //minutes

  // database
  static const String dbSettings = "dbConfig";
  static const String photoDoc = "photoDoc";
  static const String photoBox = "photoBox";
  static const String currentWeatherDoc = "currentWeatherDoc";
  static const String forecastDoc = "forecastDoc";
  static const String calendarDoc = "calendarDoc";
  static const String unitsBox = "unitBox";
  static const String cityBox = "cityBox";
  static const String hourFormatBox = "hourFormatBox";
  static const String openWeatherApiBox = "openWeatherApiBox";
  static const String refreshToken = "refreshToken";
  static const String accessToken = "accessToken";
  static const String albumId = "albumId";
  static const String album = "album";

  // Hive Type ID
  static const int hiveTypeToken = 1;
  static const int hiveTypeAlbum = 2;
  static const int hiveTypePhoto = 3;

  // Firebase & account related
  static String clientId = dotenv.env['AUTH_CLIENT_ID'] ?? "";
  static String clientSecret = dotenv.env['AUTH_CLIENT_SECRET'] ?? "";
  static const List<String> googleScope = [
    'https://www.googleapis.com/auth/photoslibrary.readonly',
    'https://www.googleapis.com/auth/calendar.readonly',
    'https://www.googleapis.com/auth/tasks.readonly',
    'profile',
    'email'
  ];
}
