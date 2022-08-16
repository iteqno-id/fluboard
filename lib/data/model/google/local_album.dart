import 'package:fluboard/constants/app_config.dart';
import 'package:googleapis/photoslibrary/v1.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'local_album.g.dart';

@HiveType(typeId: AppConfig.hiveTypeAlbum)
class LocalAlbum {
  LocalAlbum(this.id, this.coverPhotoBaseUrl, this.mediaItemsCount, this.title);

  @HiveField(0)
  final String id;
  @HiveField(1)
  final String coverPhotoBaseUrl;
  @HiveField(2)
  final String mediaItemsCount;
  @HiveField(3)
  final String title;

  factory LocalAlbum.fromAlbum(Album album) => LocalAlbum(
        album.id ?? "",
        album.coverPhotoBaseUrl ?? "",
        album.mediaItemsCount ?? "",
        album.title ?? "",
      );
}
