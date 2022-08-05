import 'dart:convert';

import 'package:fluboard/constants/app_config.dart';
import 'package:fluboard/data/datasource/remote/http_client.dart';
import 'package:fluboard/data/model/open_weather/forecast.dart';

class OpenWeatherService {
  Future<Forecast> getForecast(String city) async {
    final response = await HttpClient.get(
      AppConfig.openWeatherApiDomain,
      '/data/2.5/forecast',
      query: {"q": city, "appid": AppConfig.openWeatherApiKey},
    );
    return Forecast.fromJson(jsonDecode(response.data));
  }
}
