import 'package:fluboard/data/model/open_weather/city.dart';
import 'package:fluboard/data/model/open_weather/forecast_list.dart';

class Forecast {
  Forecast({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
    required this.city,
  });

  final String cod;
  final String message;
  final int cnt;
  final List<ForecastList> list;
  final City? city;

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
      cod: json["cod"] ?? "",
      message: json["message"].toString(),
      cnt: json["cnt"] ?? 0,
      list: json["list"] == null ? [] : List<ForecastList>.from(json["list"].map((x) => x)),
      city: json["city"] == null ? null : City.fromJson(json["city"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "cod": cod,
        "message": message,
        "cnt": cnt,
        "list": List<ForecastList>.from(list.map((x) => x)),
        "city": city?.toJson(),
      };
}
