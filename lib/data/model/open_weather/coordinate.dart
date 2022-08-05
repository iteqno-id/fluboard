class Coordinate {
  Coordinate({
    required this.lat,
    required this.lon,
  });

  final double lat;
  final double lon;

  factory Coordinate.fromJson(Map<String, dynamic> json) {
    return Coordinate(
      lat: json["lat"] ?? 0.toDouble(),
      lon: json["lon"] ?? 0.toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
      };
}
