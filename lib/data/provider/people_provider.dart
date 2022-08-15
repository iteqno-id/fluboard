import 'package:fluboard/data/model/common/result_state.dart';
import 'package:fluboard/data/repository/app_repository.dart';
import 'package:fluboard/di/injector.dart';
import 'package:flutter/foundation.dart';
import 'package:googleapis/people/v1.dart';

class PeopleProvider extends ChangeNotifier {
  final repository = getIt<AppRepository>();

  late ResultState _state;
  late String _message;
  late Person _person;

  ResultState get state => _state;
  String get message => _message;
  Person get person => _person;

  PeopleProvider() {
    _getUserInfo();
  }

  Future<dynamic> _getUserInfo() async {
    _state = ResultState.loading;
    notifyListeners();
    try {
      final result = await repository.getUserInfo();
      _state = ResultState.hasData;
      notifyListeners();
      return _person = result;
    } on DetailedApiRequestError catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = "${e.message}";
    } catch (e) {
      _state = ResultState.noData;
      notifyListeners();
      return _message = "Data not found";
    }
  }
}
