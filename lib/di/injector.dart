import 'package:fluboard/data/datasource/db/hive_database.dart';
import 'package:fluboard/data/datasource/google_datasource.dart';
import 'package:fluboard/data/datasource/local_datasource.dart';
import 'package:fluboard/data/datasource/open_weather_datasource.dart';
import 'package:fluboard/data/datasource/remote/google_calendar_service.dart';
import 'package:fluboard/data/datasource/remote/google_people_service.dart';
import 'package:fluboard/data/datasource/remote/google_photo_service.dart';
import 'package:fluboard/data/datasource/remote/google_service.dart';
import 'package:fluboard/data/datasource/remote/open_weather_service.dart';
import 'package:fluboard/data/provider/current_weather_provider.dart';
import 'package:fluboard/data/provider/forecast_provider.dart';
import 'package:fluboard/data/repository/app_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void init() {
  getIt.registerLazySingleton<OpenWeatherService>(() => OpenWeatherService());
  getIt.registerLazySingleton<HiveDatabase>(() => HiveDatabase());
  getIt.registerLazySingleton<GoogleService>(() => GoogleService());
  getIt.registerLazySingleton<GooglePeopleService>(() => GooglePeopleService());
  getIt.registerLazySingleton<GooglePhotoService>(() => GooglePhotoService());
  getIt.registerLazySingleton<GoogleCalendarService>(() => GoogleCalendarService());
  getIt.registerLazySingleton<OpenWeatherDatasourceImpl>(() => OpenWeatherDatasourceImpl(getIt()));
  getIt.registerLazySingleton<LocalDatasourceImpl>(() => LocalDatasourceImpl(getIt()));
  getIt.registerLazySingleton<GoogleDatasourceImpl>(
      () => GoogleDatasourceImpl(getIt(), getIt(), getIt(), getIt()));
  getIt.registerLazySingleton<AppRepository>(() => AppRepository(getIt(), getIt(), getIt()));
  getIt.registerLazySingleton<ForecastProvider>(() => ForecastProvider());
  getIt.registerLazySingleton<CurrentWeatherProvider>(() => CurrentWeatherProvider());
}
