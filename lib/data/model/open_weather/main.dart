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
      temp: double.parse(json["temp"].toString()),
      feelsLike: double.parse(json["feels_like"].toString()),
      tempMin: double.parse(json["temp_min"].toString()),
      tempMax: double.parse(json["temp_max"].toString()),
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

  int tempRound() => temp.round().toInt();
  int feelsLikeRound() => feelsLike.round().toInt();
}
