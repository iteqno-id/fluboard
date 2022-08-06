class FeelsLike {
  FeelsLike({
    required this.day,
    required this.night,
    required this.eve,
    required this.morn,
  });

  final double day;
  final double night;
  final double eve;
  final double morn;

  factory FeelsLike.fromJson(Map<String, dynamic> json) {
    return FeelsLike(
      day: json["day"] ?? 0.toDouble(),
      night: json["night"] ?? 0.toDouble(),
      eve: json["eve"] ?? 0.toDouble(),
      morn: json["morn"] ?? 0.toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        "day": day,
        "night": night,
        "eve": eve,
        "morn": morn,
      };
}
