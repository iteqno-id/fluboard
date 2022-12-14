import 'package:fluboard/constants/app_config.dart';
import 'package:fluboard/data/model/common/result_state.dart';
import 'package:fluboard/data/model/open_weather/forecast.dart';
import 'package:fluboard/data/repository/app_repository.dart';
import 'package:fluboard/di/injector.dart';
import 'package:flutter/foundation.dart';

class ForecastProvider extends ChangeNotifier {
  final repository = getIt<AppRepository>();

  late ResultState _state;
  late String _message;
  late Forecast _forecast;

  ResultState get state => _state;
  String get message => _message;
  Forecast get forecast => _forecast;

  ForecastProvider getWeather() {
    _getForecast();
    return this;
  }

  Future<dynamic> _getForecast() async {
    _state = ResultState.loading;
    notifyListeners();
    String city = repository.getConfig(AppConfig.cityBox, "Jakarta");
    final units = repository.getConfig(AppConfig.unitsBox, "metric");
    final result = await repository.getForecast(city, units);
    if (result.cod == "200") {
      _state = ResultState.hasData;
      notifyListeners();
      return _forecast = result;
    } else {
      _state = ResultState.noData;
      notifyListeners();
      return _message = result.message;
    }
  }
}
