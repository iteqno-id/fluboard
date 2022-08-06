import 'package:fluboard/data/model/open_weather/clouds.dart';
import 'package:fluboard/data/model/open_weather/coordinate.dart';
import 'package:fluboard/data/model/open_weather/main.dart';
import 'package:fluboard/data/model/open_weather/sys.dart';
import 'package:fluboard/data/model/open_weather/weather.dart';
import 'package:fluboard/data/model/open_weather/wind.dart';

class CurrentWeather {
  CurrentWeather({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  final Coordinate coord;
  final List<Weather> weather;
  final String base;
  final Main main;
  final int visibility;
  final Wind wind;
  final Clouds clouds;
  final int dt;
  final Sys sys;
  final int timezone;
  final int id;
  final String name;
  final int cod;

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
      coord: Coordinate.fromJson(json["coord"]),
      weather: List<Weather>.from(json["weather"]!.map((x) => Weather.fromJson(x))),
      base: json["base"] ?? "",
      main: Main.fromJson(json["main"]),
      visibility: json["visibility"] ?? 0,
      wind: Wind.fromJson(json["wind"]),
      clouds: Clouds.fromJson(json["clouds"]),
      dt: json["dt"] ?? 0,
      sys: Sys.fromJson(json["sys"]),
      timezone: json["timezone"] ?? 0,
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      cod: json["cod"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "coord": coord.toJson(),
        "weather": List<Weather>.from(weather.map((x) => x.toJson())),
        "base": base,
        "main": main.toJson(),
        "visibility": visibility,
        "wind": wind.toJson(),
        "clouds": clouds.toJson(),
        "dt": dt,
        "sys": sys.toJson(),
        "timezone": timezone,
        "id": id,
        "name": name,
        "cod": cod,
      };
}
