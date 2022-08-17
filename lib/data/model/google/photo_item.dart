import 'package:fluboard/constants/app_config.dart';
import 'package:googleapis/photoslibrary/v1.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'photo_item.g.dart';

@HiveType(typeId: AppConfig.hiveTypePhoto)
class PhotoItem {
  PhotoItem(this.id, this.baseUrl, this.description, this.filename, this.productUrl);

  @HiveField(0)
  final String id;
  @HiveField(1)
  final String baseUrl;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final String filename;
  @HiveField(4)
  final String productUrl;

  factory PhotoItem.fromMediaItem(MediaItem media) => PhotoItem(
        media.id ?? "",
        media.baseUrl ?? "",
        media.description ?? "",
        media.filename ?? "",
        media.productUrl ?? "",
      );

  photoLarge() => "$baseUrl=h1024";
}
