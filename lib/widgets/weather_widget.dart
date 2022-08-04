import 'package:fluboard/widgets/main_weather_item.dart';
import 'package:fluboard/widgets/weather_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: const [
          MainWeatherItem(icon: CupertinoIcons.cloud_bolt_rain, temp: 25, windSpeed: 7),
          Spacer(),
          WeatherItem(day: "FRI", temp: 29, icon: CupertinoIcons.cloud_drizzle),
          WeatherItem(day: "SAT", temp: 30, icon: CupertinoIcons.sun_max),
          WeatherItem(day: "SUN", temp: 29, icon: CupertinoIcons.cloud_sun_bolt),
          WeatherItem(day: "MON", temp: 29, icon: CupertinoIcons.cloud_sun),
        ],
      ),
    );
  }
}
