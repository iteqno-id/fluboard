import 'package:fluboard/data/datasource/remote/google_people_service.dart';
import 'package:fluboard/data/datasource/remote/google_photo_service.dart';
import 'package:fluboard/data/datasource/remote/google_service.dart';
import 'package:googleapis/people/v1.dart';
import 'package:googleapis/photoslibrary/v1.dart';
import 'package:googleapis_auth/auth_io.dart';

abstract class GoogleDatasource {
  Future<AuthClient> login(Function(String) callback);
  Future<AccessCredentials> refreshToken();
  Future<Person> getPerson();
  Future<ListAlbumsResponse> getAlbums();
  Future<Album> getAlbum(String albumId);
  Future<SearchMediaItemsResponse> photoSearch(String albumId);
  Future<ListSharedAlbumsResponse> sharedAlbums();
}

class GoogleDatasourceImpl extends GoogleDatasource {
  GoogleDatasourceImpl(this.googleService, this.peopleService, this.photoService);

  final GoogleService googleService;
  final GooglePeopleService peopleService;
  final GooglePhotoService photoService;

  @override
  Future<AuthClient> login(Function(String url) callback) => googleService.login(callback);

  @override
  Future<AccessCredentials> refreshToken() => googleService.refreshToken();

  @override
  Future<Person> getPerson() => peopleService.getPerson();

  @override
  Future<ListAlbumsResponse> getAlbums() => photoService.getAlbums();

  @override
  Future<Album> getAlbum(String albumId) => photoService.getAlbum(albumId);

  @override
  Future<SearchMediaItemsResponse> photoSearch(String albumId) => photoService.search(albumId);

  @override
  Future<ListSharedAlbumsResponse> sharedAlbums() => photoService.getSharedAlbums();
}
