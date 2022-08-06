import 'package:fluboard/data/model/open_weather/coordinate.dart';

class City {
  City({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
  });

  final int id;
  final String name;
  final Coordinate? coord;
  final String country;
  final int population;
  final int timezone;

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      coord: json["coord"] == null ? null : Coordinate.fromJson(json["coord"]),
      country: json["country"] ?? "",
      population: json["population"] ?? 0,
      timezone: json["timezone"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "coord": coord?.toJson(),
        "country": country,
        "population": population,
        "timezone": timezone,
      };
}
