import 'package:fluboard/constants/app_config.dart';
import 'package:fluboard/data/datasource/repository/app_repository.dart';
import 'package:fluboard/data/model/common/result_state.dart';
import 'package:fluboard/data/model/open_weather/current_weather.dart';
import 'package:fluboard/di/injector.dart';
import 'package:flutter/foundation.dart';

class CurrentWeatherProvider extends ChangeNotifier {
  final repository = getIt<AppRepository>();

  late ResultState _state;
  late String _message;
  late CurrentWeather _currentWeather;

  ResultState get state => _state;
  String get message => _message;
  CurrentWeather get currentWeather => _currentWeather;

  CurrentWeatherProvider getCurrentWeather() {
    _getCurrentWeather();
    return this;
  }

  Future<dynamic> _getCurrentWeather() async {
    _state = ResultState.loading;
    notifyListeners();
    String city = repository.getConfig(AppConfig.cityBox, "Jakarta");
    final units = repository.getConfig(AppConfig.unitsBox, "metric");
    final result = await repository.getCurrentWeather(city, units);
    if (result.cod == 200) {
      _state = ResultState.hasData;
      notifyListeners();
      return _currentWeather = result;
    } else {
      _state = ResultState.noData;
      notifyListeners();
      return _message = "Error or city not found";
    }
  }
}
