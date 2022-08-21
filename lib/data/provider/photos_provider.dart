import 'package:fluboard/data/model/common/result_state.dart';
import 'package:fluboard/data/model/google/photo_item.dart';
import 'package:fluboard/data/repository/app_repository.dart';
import 'package:fluboard/di/injector.dart';
import 'package:flutter/foundation.dart';

class PhotosProvider extends ChangeNotifier {
  final repository = getIt<AppRepository>();

  late ResultState _state;
  late String _message;
  late PhotoItem _photo;

  ResultState get state => _state;
  String get message => _message;
  PhotoItem get photo => _photo;

  PhotosProvider() {
    _getPhoto();
  }

  Future<dynamic> refreshPhoto() => _getPhoto();

  Future<dynamic> _getPhoto() async {
    _state = ResultState.loading;
    notifyListeners();

    try {
      final result = repository.getRandomPhoto();
      if (result != null) {
        _state = ResultState.hasData;
        notifyListeners();
        return _photo = result;
      } else {
        _state = ResultState.noData;
        notifyListeners();
        return _message = "No data found";
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = "Error happened guys!";
    }
  }
}
