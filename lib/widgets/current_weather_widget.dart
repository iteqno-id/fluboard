import 'dart:async';

import 'package:fluboard/constants/app_config.dart';
import 'package:fluboard/data/model/common/result_state.dart';
import 'package:fluboard/data/provider/current_weather_provider.dart';
import 'package:fluboard/utils/extension.dart';
import 'package:fluboard/utils/weather_icon_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CurrentWeatherWidget extends StatefulWidget {
  const CurrentWeatherWidget({Key? key}) : super(key: key);

  @override
  State<CurrentWeatherWidget> createState() => _CurrentWeatherWidgetState();
}

class _CurrentWeatherWidgetState extends State<CurrentWeatherWidget> {
  @override
  void initState() {
    tick();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8),
      child: Consumer<CurrentWeatherProvider>(
        builder: (context, provider, _) {
          if (provider.state == ResultState.loading) {
            return const Center(child: CupertinoActivityIndicator());
          } else if (provider.state == ResultState.hasData) {
            final weather = provider.currentWeather;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  weather.weather.first.icon.asWeatherIconNow(),
                  size: 96,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(CupertinoIcons.location_solid),
                    const SizedBox(width: 4),
                    Text(weather.name),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(CupertinoIcons.thermometer),
                    const SizedBox(width: 4),
                    Text("${weather.main.temp}\u00B0"),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(CupertinoIcons.thermometer),
                    const SizedBox(width: 4),
                    Text("${weather.main.feelsLike}\u00B0 feels"),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(CupertinoIcons.drop),
                    const SizedBox(width: 4),
                    Text("${weather.main.humidity}%"),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(CupertinoIcons.wind),
                    const SizedBox(width: 4),
                    Text("${weather.wind.speed.asKmph()} kmph"),
                  ],
                ),
              ],
            );
          } else {
            return Center(child: Text(provider.message));
          }
        },
      ),
    );
  }

  tick() {
    Timer.periodic(const Duration(minutes: AppConfig.currentWeatherRefresh), (timer) {
      Provider.of<CurrentWeatherProvider>(context, listen: false).getCurrentWeather();
    });
  }
}