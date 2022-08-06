import 'package:fluboard/data/datasource/remote/open_weather_service.dart';
import 'package:fluboard/data/model/open_weather/current_weather.dart';
import 'package:fluboard/data/model/open_weather/forecast.dart';

abstract class OpenWeatherDatasource {
  Future<Forecast> getForecast(String city);
  Future<CurrentWeather> getCurrentWeather(String city);
}

class OpenWeatherDatasourceImpl extends OpenWeatherDatasource {
  OpenWeatherDatasourceImpl(this.openWeatherService);

  final OpenWeatherService openWeatherService;

  @override
  Future<Forecast> getForecast(String city) => openWeatherService.getForecast(city);

  @override
  Future<CurrentWeather> getCurrentWeather(String city) =>
      openWeatherService.getCurrentWeather(city);
}
