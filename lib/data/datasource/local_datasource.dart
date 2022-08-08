import 'package:fluboard/data/datasource/db/hive_database.dart';

abstract class LocalDatasource {
  getConfig<T>(String key, T defaultValue);
  Future<void> setConfig(String key, dynamic value);
}

class LocalDatasourceImpl implements LocalDatasource {
  LocalDatasourceImpl(this.database);
  final HiveDatabase database;

  @override
  getConfig<T>(String key, T defaultValue) => database.getConfig<T>(key, defaultValue);

  @override
  Future<void> setConfig(String key, value) => database.setConfig(key, value);
}
