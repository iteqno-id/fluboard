class AppConfig {
  static const String openWeatherApiDomain = "api.openweathermap.org";
  static const String openWeatherIconUrl = "https://openweathermap.org/img/wn/";
  static const String units = "metric"; //metric, imperial
  static const int photoRefresh = 30; //seconds
  static const int currentWeatherRefresh = 30; //minutes
  static const int forecastRefresh = 1; //hours

  // database
  static const String dbSettings = "dbConfig";
  static const String photoDoc = "photoDoc";
  static const String currentWeatherDoc = "currentWeatherDoc";
  static const String forecastDoc = "forecastDoc";
  static const String unitsBox = "unitBox";
  static const String cityBox = "cityBox";
  static const String hourFormatBox = "hourFormatBox";
  static const String openWeatherApiBox = "openWeatherApiBox";
}
