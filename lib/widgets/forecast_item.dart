import 'package:fluboard/data/model/open_weather/forecast_item.dart';
import 'package:fluboard/utils/extension.dart';
import 'package:fluboard/utils/weather_icon_extension.dart';
import 'package:flutter/material.dart';

class ForecastItemWidget extends StatelessWidget {
  const ForecastItemWidget({
    Key? key,
    required this.forecast,
  }) : super(key: key);
  final ForecastItem forecast;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(forecast.dateTime().asDayShort()),
          const SizedBox(height: 4),
          Icon(forecast.weather.first.icon.asWeatherIcon(), size: 56),
          const SizedBox(height: 4),
          Text("${forecast.temp?.min.toInt()}\u00B0-${forecast.temp?.max.toInt()}\u00B0"),
        ],
      ),
    );
  }
}
