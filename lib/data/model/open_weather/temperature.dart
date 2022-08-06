class Temperature {
  Temperature({
    required this.day,
    required this.min,
    required this.max,
    required this.night,
    required this.eve,
    required this.morn,
  });

  final double day;
  final double min;
  final double max;
  final double night;
  final double eve;
  final double morn;

  factory Temperature.fromJson(Map<String, dynamic> json) {
    return Temperature(
      day: json["day"] ?? 0.toDouble(),
      min: json["min"] ?? 0.toDouble(),
      max: json["max"] ?? 0.toDouble(),
      night: json["night"] ?? 0.toDouble(),
      eve: json["eve"] ?? 0.toDouble(),
      morn: json["morn"] ?? 0.toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        "day": day,
        "min": min,
        "max": max,
        "night": night,
        "eve": eve,
        "morn": morn,
      };
}
