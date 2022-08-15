import 'package:fluboard/data/datasource/google_datasource.dart';
import 'package:fluboard/data/datasource/local_datasource.dart';
import 'package:fluboard/data/datasource/open_weather_datasource.dart';
import 'package:fluboard/data/model/open_weather/current_weather.dart';
import 'package:fluboard/data/model/open_weather/forecast.dart';
import 'package:googleapis/people/v1.dart';
import 'package:googleapis_auth/auth_io.dart';

class AppRepository {
  AppRepository(this.openWeatherDatasourceImpl, this.database, this.googleDatasource);
  final OpenWeatherDatasourceImpl openWeatherDatasourceImpl;
  final LocalDatasourceImpl database;
  final GoogleDatasourceImpl googleDatasource;

  getConfig<T>(String key, T defaultValue) => database.getConfig(key, defaultValue);
  Future<void> setConfig(String key, dynamic value) => database.setConfig(key, value);

  Future<Forecast> getForecast(String city, String units) =>
      openWeatherDatasourceImpl.getForecast(city, units);
  Future<CurrentWeather> getCurrentWeather(String city, String units) =>
      openWeatherDatasourceImpl.getCurrentWeather(city, units);

  Future<AuthClient> login(Function(String) callback) => googleDatasource.login(callback);
  Future<AccessCredentials> refreshToken() => googleDatasource.refreshToken();
  Future<Person> getUserInfo() => googleDatasource.getPerson();
}
