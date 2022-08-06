import 'package:fluboard/data/datasource/repository/app_repository.dart';
import 'package:fluboard/data/model/common/result_state.dart';
import 'package:fluboard/data/model/open_weather/current_weather.dart';
import 'package:fluboard/di/injector.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

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
    String city = dotenv.get('CITY');
    final result = await repository.getCurrentWeather(city);
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
