import 'package:fluboard/data/datasource/open_weather_datasource.dart';
import 'package:fluboard/data/model/open_weather/current_weather.dart';
import 'package:fluboard/data/model/open_weather/forecast.dart';

class AppRepository {
  final OpenWeatherDatasourceImpl openWeatherDatasourceImpl;

  AppRepository(this.openWeatherDatasourceImpl);

  Future<Forecast> getForecast(String city) => openWeatherDatasourceImpl.getForecast(city);
  Future<CurrentWeather> getCurrentWeather(String city) =>
      openWeatherDatasourceImpl.getCurrentWeather(city);
}
