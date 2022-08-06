import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static String openWeatherApiKey = dotenv.get('OPEN_WEATHER_API_KEY');
  static const String openWeatherApiDomain = "api.openweathermap.org";
  static const String openWeatherIconUrl = "https://openweathermap.org/img/wn/";
  static const String units = "metric"; //metric, imperial
  static const int photoRefresh = 30; //seconds
  static const int currentWeatherRefresh = 30; //minutes
  static const int forecastRefresh = 1; //hours
}
