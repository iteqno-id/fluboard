import 'package:fluboard/constants/app_config.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'local_access_token.g.dart';

@HiveType(typeId: AppConfig.hiveTypeToken)
class LocalAccessToken {
  LocalAccessToken({
    required this.type,
    required this.data,
    required this.expiry,
  });

  @HiveField(0)
  final String type;

  @HiveField(1)
  final String data;

  @HiveField(2)
  final DateTime expiry;

  factory LocalAccessToken.fromJson(Map<String, dynamic> json) {
    return LocalAccessToken(
      type: json["type"] ?? "",
      data: json["data"] ?? "",
      expiry: DateTime.parse(json["expiry"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "type": type,
        "data": data,
        "expiry": expiry.toIso8601String(),
      };

  bool isValid() => DateTime.now().isBefore(expiry);
}
