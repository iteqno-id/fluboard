import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static String openWeatherApiKey = dotenv.get('OPEN_WEATHER_API_KEY');
  static const String openWeatherApiDomain = "api.openweathermap.org";
}
