import 'package:fluboard/data/model/open_weather/clouds.dart';
import 'package:fluboard/data/model/open_weather/main_model.dart';
import 'package:fluboard/data/model/open_weather/rain.dart';
import 'package:fluboard/data/model/open_weather/sys.dart';
import 'package:fluboard/data/model/open_weather/weather.dart';
import 'package:fluboard/data/model/open_weather/wind.dart';

class ForecastList {
  ForecastList({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    required this.rain,
    required this.sys,
    required this.dtTxt,
  });

  final int dt;
  final Main? main;
  final List<Weather> weather;
  final Clouds? clouds;
  final Wind? wind;
  final int visibility;
  final double pop;
  final Rain? rain;
  final Sys? sys;
  final DateTime? dtTxt;

  factory ForecastList.fromJson(Map<String, dynamic> json) {
    return ForecastList(
      dt: json["dt"] ?? 0,
      main: json["main"] == null ? null : Main.fromJson(json["main"]),
      weather: json["weather"] == null
          ? []
          : List<Weather>.from(json["weather"]!.map((x) => Weather.fromJson(x))),
      clouds: json["clouds"] == null ? null : Clouds.fromJson(json["clouds"]),
      wind: json["wind"] == null ? null : Wind.fromJson(json["wind"]),
      visibility: json["visibility"] ?? 0,
      pop: json["pop"] ?? 0.toDouble(),
      rain: json["rain"] == null ? null : Rain.fromJson(json["rain"]),
      sys: json["sys"] == null ? null : Sys.fromJson(json["sys"]),
      dtTxt: json["dt_txt"] == null ? null : DateTime.parse(json["dt_txt"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "dt": dt,
        "main": main?.toJson(),
        "weather": List<Weather>.from(weather.map((x) => x.toJson())),
        "clouds": clouds?.toJson(),
        "wind": wind?.toJson(),
        "visibility": visibility,
        "pop": pop,
        "rain": rain?.toJson(),
        "sys": sys?.toJson(),
        "dt_txt": dtTxt?.toIso8601String(),
      };
}
