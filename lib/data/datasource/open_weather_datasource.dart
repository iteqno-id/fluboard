import 'package:fluboard/data/datasource/remote/open_weather_service.dart';
import 'package:fluboard/data/model/open_weather/current_weather.dart';
import 'package:fluboard/data/model/open_weather/forecast.dart';

abstract class OpenWeatherDatasource {
  Future<Forecast> getForecast(String city, String units);
  Future<CurrentWeather> getCurrentWeather(String city, String units);
}

class OpenWeatherDatasourceImpl extends OpenWeatherDatasource {
  OpenWeatherDatasourceImpl(this.openWeatherService);

  final OpenWeatherService openWeatherService;

  @override
  Future<Forecast> getForecast(String city, String units) =>
      openWeatherService.getForecast(city, units);

  @override
  Future<CurrentWeather> getCurrentWeather(String city, String units) =>
      openWeatherService.getCurrentWeather(city, units);
}
