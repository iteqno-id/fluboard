import 'package:flutter/cupertino.dart';

extension WeatherIconExtension on String {
  IconData asWeatherIconNow() {
    var icon = this;
    if (DateTime.now().hour < 6 || DateTime.now().hour >= 18) {
      icon = replaceAll('d', 'n');
    }
    return icon.asWeatherIcon();
  }

  IconData asWeatherIcon() {
    switch (this) {
      case "01d":
        return CupertinoIcons.sun_max;
      case "02d":
        return CupertinoIcons.cloud_sun;
      case "03d":
        return CupertinoIcons.cloud;
      case "04d":
        return CupertinoIcons.cloud;
      case "09d":
        return CupertinoIcons.cloud_drizzle;
      case "10d":
        return CupertinoIcons.cloud_sun_rain;
      case "11d":
        return CupertinoIcons.cloud_bolt;
      case "13d":
        return CupertinoIcons.snow;
      case "50d":
        return CupertinoIcons.sun_haze;
      case "01n":
        return CupertinoIcons.moon;
      case "02n":
        return CupertinoIcons.cloud_moon;
      case "03n":
        return CupertinoIcons.cloud;
      case "04n":
        return CupertinoIcons.cloud;
      case "09n":
        return CupertinoIcons.cloud_drizzle;
      case "10n":
        return CupertinoIcons.cloud_moon_rain;
      case "11n":
        return CupertinoIcons.cloud_bolt;
      case "13n":
        return CupertinoIcons.snow;
      case "50n":
        return CupertinoIcons.sun_haze;
      default:
        return CupertinoIcons.arrow_2_circlepath;
    }
  }
}
