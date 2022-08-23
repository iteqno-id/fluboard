import 'package:fluboard/constants/app_config.dart';
import 'package:fluboard/data/model/google/local_access_token.dart';
import 'package:fluboard/data/repository/app_repository.dart';
import 'package:fluboard/di/injector.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class GoogleService {
  Future<AuthClient> login(Function(String) callback) async => await clientViaUserConsent(
        ClientId(AppConfig.clientId, AppConfig.clientSecret),
        AppConfig.googleScope,
        callback,
      );

  Future<AccessCredentials?> refreshToken() async {
    final repo = getIt<AppRepository>();
    var token =
        await repo.getConfig<LocalAccessToken?>(AppConfig.accessToken, null) as LocalAccessToken;
    var accessToken = AccessToken(token.type, token.data, token.expiry);
    var refreshToken = await repo.getConfig(AppConfig.refreshToken, "");
    AccessCredentials? ac;
    try {
      ac = await refreshCredentials(ClientId(AppConfig.clientId, AppConfig.clientSecret),
          AccessCredentials(accessToken, refreshToken, AppConfig.googleScope), http.Client());

      repo.setConfig(AppConfig.accessToken, LocalAccessToken.fromAccessCredential(ac.accessToken));
      return ac;
    } catch (e) {
      repo.login((url) {
        launchUrl(Uri.parse(url));
      }).then((value) {
        var accessToken = value.credentials.accessToken;
        repo.setConfig(AppConfig.refreshToken, value.credentials.refreshToken);
        repo.setConfig(
            AppConfig.accessToken,
            LocalAccessToken(
              type: accessToken.type,
              data: accessToken.data,
              expiry: accessToken.expiry,
            ));
        return accessToken;
      });
    }
    return ac;
  }
}
