import 'package:fluboard/data/datasource/remote/google_people_service.dart';
import 'package:fluboard/data/datasource/remote/google_service.dart';
import 'package:googleapis/people/v1.dart';
import 'package:googleapis_auth/auth_io.dart';

abstract class GoogleDatasource {
  Future<AuthClient> login(Function(String) callback);
  Future<AccessCredentials> refreshToken();
  Future<Person> getPerson();
}

class GoogleDatasourceImpl extends GoogleDatasource {
  GoogleDatasourceImpl(this.googleService, this.peopleService);

  final GoogleService googleService;
  final GooglePeopleService peopleService;

  @override
  Future<AuthClient> login(Function(String url) callback) => googleService.login(callback);

  @override
  Future<AccessCredentials> refreshToken() => googleService.refreshToken();

  @override
  Future<Person> getPerson() => peopleService.getPerson();
}
