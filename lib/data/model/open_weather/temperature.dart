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
      day: double.parse('${json["day"]}'),
      min: double.parse('${json["min"]}'),
      max: double.parse('${json["max"]}'),
      night: double.parse('${json["night"]}'),
      eve: double.parse('${json["eve"]}'),
      morn: double.parse('${json["morn"]}'),
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
