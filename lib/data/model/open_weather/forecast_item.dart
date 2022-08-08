import 'package:fluboard/data/model/open_weather/feels_like.dart';
import 'package:fluboard/data/model/open_weather/temperature.dart';
import 'package:fluboard/data/model/open_weather/weather.dart';

class ForecastItem {
  ForecastItem({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.weather,
    required this.speed,
    required this.deg,
    required this.gust,
    required this.clouds,
    required this.pop,
    required this.rain,
  });

  final int dt;
  final int sunrise;
  final int sunset;
  final Temperature? temp;
  final FeelsLike? feelsLike;
  final int pressure;
  final int humidity;
  final List<Weather> weather;
  final double speed;
  final int deg;
  final double gust;
  final int clouds;
  final double pop;
  final double rain;

  factory ForecastItem.fromJson(Map<String, dynamic> json) {
    return ForecastItem(
      dt: json["dt"] ?? 0,
      sunrise: json["sunrise"] ?? 0,
      sunset: json["sunset"] ?? 0,
      temp: json["temp"] == null ? null : Temperature.fromJson(json["temp"]),
      feelsLike: json["feels_like"] == null ? null : FeelsLike.fromJson(json["feels_like"]),
      pressure: json["pressure"] ?? 0,
      humidity: json["humidity"] ?? 0,
      weather: json["weather"] == null
          ? []
          : List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
      speed: double.parse('${json["speed"]}'),
      deg: json["deg"] ?? 0,
      gust: double.parse('${json["gust"]}'),
      clouds: json["clouds"] ?? 0,
      pop: double.parse('${json["pop"]}'),
      rain: double.parse('${json["rain"]}'),
    );
  }

  Map<String, dynamic> toJson() => {
        "dt": dt,
        "sunrise": sunrise,
        "sunset": sunset,
        "temp": temp?.toJson(),
        "feels_like": feelsLike?.toJson(),
        "pressure": pressure,
        "humidity": humidity,
        "weather": List<Weather>.from(weather.map((x) => x.toJson())),
        "speed": speed,
        "deg": deg,
        "gust": gust,
        "clouds": clouds,
        "pop": pop,
        "rain": rain,
      };

  DateTime dateTime() => DateTime.fromMillisecondsSinceEpoch(dt * 1000, isUtc: true);

  double tempNow() {
    int hour = DateTime.now().hour;
    if (hour <= 6) {
      return temp?.night ?? 0.toDouble();
    }
    if (hour <= 12) {
      return temp?.morn ?? 0.toDouble();
    }
    if (hour <= 18) {
      return temp?.day ?? 0.toDouble();
    } else {
      return temp?.night ?? 0.toDouble();
    }
  }
}
