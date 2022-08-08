class Wind {
  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  final double speed;
  final int deg;
  final double gust;

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
      speed: double.parse('${json["speed"]}'),
      deg: json["deg"] ?? 0,
      gust: double.parse('${json["gust"] ?? "0"}'),
    );
  }

  Map<String, dynamic> toJson() => {
        "speed": speed,
        "deg": deg,
        "gust": gust,
      };
}
