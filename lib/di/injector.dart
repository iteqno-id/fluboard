import 'package:fluboard/data/datasource/open_weather_datasource.dart';
import 'package:fluboard/data/datasource/remote/open_weather_service.dart';
import 'package:fluboard/data/datasource/repository/app_repository.dart';
import 'package:fluboard/data/provider/current_weather_provider.dart';
import 'package:fluboard/data/provider/forecast_provider.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void init() {
  getIt.registerLazySingleton<OpenWeatherService>(() => OpenWeatherService());
  getIt.registerLazySingleton<OpenWeatherDatasourceImpl>(() => OpenWeatherDatasourceImpl(getIt()));
  getIt.registerLazySingleton<AppRepository>(() => AppRepository(getIt()));
  getIt.registerLazySingleton<ForecastProvider>(() => ForecastProvider());
  getIt.registerLazySingleton<CurrentWeatherProvider>(() => CurrentWeatherProvider());
}
