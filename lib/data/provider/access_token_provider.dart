import 'package:fluboard/constants/app_config.dart';
import 'package:fluboard/data/model/common/result_state.dart';
import 'package:fluboard/data/model/google/local_access_token.dart';
import 'package:fluboard/data/repository/app_repository.dart';
import 'package:fluboard/di/injector.dart';
import 'package:flutter/foundation.dart';

class AccessTokenProvider extends ChangeNotifier {
  final repository = getIt<AppRepository>();

  late ResultState _state;
  late String _message;
  late LocalAccessToken _accessToken;
  late String _refreshToken;

  ResultState get state => _state;
  String get message => _message;
  LocalAccessToken get accessToken => _accessToken;
  String get refreshToken => _refreshToken;

  AccessTokenProvider() {
    getAccessToken();
  }

  Future<dynamic> getAccessToken() async {
    _state = ResultState.loading;
    notifyListeners();
    final result = await repository.getConfig<LocalAccessToken?>(AppConfig.accessToken, null)
        as LocalAccessToken?;
    if (result != null && result.isValid()) {
      _state = ResultState.hasData;
      notifyListeners();
      return _accessToken = result;
    } else {
      final refreshToken = await repository.getConfig<String>(AppConfig.refreshToken, "");
      if (refreshToken.isNotEmpty) {
        final refresh = await repository.refreshToken();
        var accessToken = LocalAccessToken(
          type: refresh.accessToken.type,
          data: refresh.accessToken.data,
          expiry: refresh.accessToken.expiry,
        );
        await repository.setConfig(AppConfig.accessToken, accessToken);
        _state = ResultState.noData;
        notifyListeners();
        return _accessToken = accessToken;
      }
      _state = ResultState.noData;
      notifyListeners();
      return _message = 'Access token not found or expired. Please generate a new one!';
    }
  }
}
