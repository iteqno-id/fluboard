import 'package:fluboard/constants/app_config.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDatabase {
  final configBox = Hive.box(AppConfig.dbSettings);

  getConfig<T>(String key, T defaultValue) {
    return configBox.get(key) == null ? defaultValue : configBox.get(key) as T;
  }

  Future<void> setConfig(String key, dynamic value) async {
    configBox.put(key, value);
  }
}
