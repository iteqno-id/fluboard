class Coordinate {
  Coordinate({
    required this.lon,
    required this.lat,
  });

  final double lon;
  final double lat;

  factory Coordinate.fromJson(Map<String, dynamic> json) {
    return Coordinate(
      lon: json["lon"] ?? 0.toDouble(),
      lat: json["lat"] ?? 0.toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        "lon": lon,
        "lat": lat,
      };
}
