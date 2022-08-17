import 'dart:math';

import 'package:fluboard/constants/app_config.dart';
import 'package:fluboard/data/model/google/photo_item.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDatabase {
  final configBox = Hive.box(AppConfig.dbSettings);
  final photoBox = Hive.box<PhotoItem>(AppConfig.photoBox);

  getConfig<T>(String key, T defaultValue) {
    return configBox.get(key) == null ? defaultValue : configBox.get(key) as T;
  }

  Future<void> setConfig(String key, dynamic value) async {
    configBox.put(key, value);
  }

  Future<void> addPhotoAll(List<PhotoItem> photos) async {
    await photoBox.clear();
    await photoBox.addAll(photos);
  }

  List<PhotoItem> getLocalPhotos() => photoBox.values.toList();

  PhotoItem? getRandomPhoto() {
    final photos = getLocalPhotos();

    if (photos.isEmpty) return null;

    int rand = Random().nextInt(photos.length);

    return photos[rand];
  }
}
