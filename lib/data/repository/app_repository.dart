import 'package:fluboard/constants/app_config.dart';
import 'package:fluboard/data/datasource/google_datasource.dart';
import 'package:fluboard/data/datasource/local_datasource.dart';
import 'package:fluboard/data/datasource/open_weather_datasource.dart';
import 'package:fluboard/data/model/google/photo_item.dart';
import 'package:fluboard/data/model/open_weather/current_weather.dart';
import 'package:fluboard/data/model/open_weather/forecast.dart';
import 'package:googleapis/people/v1.dart';
import 'package:googleapis/photoslibrary/v1.dart';
import 'package:googleapis_auth/auth_io.dart';

class AppRepository {
  AppRepository(this.openWeatherDatasourceImpl, this.database, this.googleDatasource);
  final OpenWeatherDatasourceImpl openWeatherDatasourceImpl;
  final LocalDatasourceImpl database;
  final GoogleDatasourceImpl googleDatasource;

  getConfig<T>(String key, T defaultValue) => database.getConfig(key, defaultValue);
  Future<void> setConfig(String key, dynamic value) => database.setConfig(key, value);
  List<PhotoItem> getLocalPhotos() => database.getLocalPhotos();
  Future<void> addAllPhotos(List<PhotoItem> photos) => database.addPhotoAll(photos);
  PhotoItem? getRandomPhoto() => database.getRandomPhoto();
  Future<bool> refreshPhoto() async {
    final albumId = database.getConfig<String>(AppConfig.albumId, "");
    final photosOnline = await googleDatasource.photoSearch(albumId);
    final photos = photosOnline.mediaItems?.map((e) => PhotoItem.fromMediaItem(e)).toList() ?? [];
    await database.addPhotoAll(photos);
    return photos.isNotEmpty;
  }

  Future<Forecast> getForecast(String city, String units) =>
      openWeatherDatasourceImpl.getForecast(city, units);
  Future<CurrentWeather> getCurrentWeather(String city, String units) =>
      openWeatherDatasourceImpl.getCurrentWeather(city, units);

  Future<AuthClient> login(Function(String) callback) => googleDatasource.login(callback);
  Future<AccessCredentials> refreshToken() => googleDatasource.refreshToken();
  Future<Person> getUserInfo() => googleDatasource.getPerson();
  Future<ListAlbumsResponse> getAlbums() => googleDatasource.getAlbums();
  Future<Album> getAlbum(String albumId) => googleDatasource.getAlbum(albumId);
  Future<SearchMediaItemsResponse> photoSearch(String albumId) =>
      googleDatasource.photoSearch(albumId);
  Future<ListSharedAlbumsResponse> sharedAlbums() => googleDatasource.sharedAlbums();
}
