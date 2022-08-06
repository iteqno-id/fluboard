class Main {
  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.seaLevel,
    required this.grndLevel,
  });

  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;
  final int seaLevel;
  final int grndLevel;

  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
      temp: json["temp"] ?? 0.toDouble(),
      feelsLike: json["feels_like"] ?? 0.toDouble(),
      tempMin: json["temp_min"] ?? 0.toDouble(),
      tempMax: json["temp_max"] ?? 0.toDouble(),
      pressure: json["pressure"] ?? 0,
      humidity: json["humidity"] ?? 0,
      seaLevel: json["sea_level"] ?? 0,
      grndLevel: json["grnd_level"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "pressure": pressure,
        "humidity": humidity,
        "sea_level": seaLevel,
        "grnd_level": grndLevel,
      };
}
