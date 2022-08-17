import 'package:fluboard/data/datasource/db/hive_database.dart';
import 'package:fluboard/data/model/google/photo_item.dart';

abstract class LocalDatasource {
  getConfig<T>(String key, T defaultValue);
  Future<void> setConfig(String key, dynamic value);
  List<PhotoItem> getLocalPhotos();
  Future<void> addPhotoAll(List<PhotoItem> photos);
  PhotoItem? getRandomPhoto();
}

class LocalDatasourceImpl implements LocalDatasource {
  LocalDatasourceImpl(this.database);
  final HiveDatabase database;

  @override
  getConfig<T>(String key, T defaultValue) => database.getConfig<T>(key, defaultValue);

  @override
  Future<void> setConfig(String key, value) => database.setConfig(key, value);

  @override
  List<PhotoItem> getLocalPhotos() => database.getLocalPhotos();

  @override
  Future<void> addPhotoAll(List<PhotoItem> photos) => database.addPhotoAll(photos);

  @override
  PhotoItem? getRandomPhoto() => database.getRandomPhoto();
}
