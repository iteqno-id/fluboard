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
      day: double.parse('${json["day"]}'),
      night: double.parse('${json["night"]}'),
      eve: double.parse('${json["eve"]}'),
      morn: double.parse('${json["morn"]}'),
    );
  }

  Map<String, dynamic> toJson() => {
        "day": day,
        "night": night,
        "eve": eve,
        "morn": morn,
      };
}
