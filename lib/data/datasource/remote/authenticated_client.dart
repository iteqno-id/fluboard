import 'package:fluboard/constants/app_config.dart';
import 'package:fluboard/data/model/google/local_access_token.dart';
import 'package:fluboard/data/repository/app_repository.dart';
import 'package:fluboard/di/injector.dart';
import 'package:http/http.dart' as http;

class AuthenticatedClient extends http.BaseClient {
  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    final repo = getIt<AppRepository>();
    final token =
        repo.getConfig<LocalAccessToken?>(AppConfig.accessToken, null) as LocalAccessToken;
    request.headers.addAll({"Authorization": "Bearer ${token.data}"});
    return request.send();
  }
}
