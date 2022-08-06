import 'package:fluboard/data/model/common/result_state.dart';
import 'package:fluboard/data/provider/forecast_provider.dart';
import 'package:fluboard/widgets/current_weather_widget.dart';
import 'package:fluboard/widgets/forecast_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Consumer<ForecastProvider>(
        builder: (context, provider, _) {
          if (provider.state == ResultState.loading) {
            return const Center(child: CupertinoActivityIndicator());
          } else if (provider.state == ResultState.hasData) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                CurrentWeatherWidget(),
                Spacer(),
                ForecastWidget(),
              ],
            );
          } else {
            return Center(child: Text(provider.message));
          }
        },
        // child: Row(
        //   crossAxisAlignment: CrossAxisAlignment.end,
        //   children: const [
        //     MainWeatherItem(icon: CupertinoIcons.cloud_bolt_rain, temp: 25, windSpeed: 7),
        //     Spacer(),
        //     WeatherItem(day: "FRI", temp: 29, icon: CupertinoIcons.cloud_drizzle),
        //     WeatherItem(day: "SAT", temp: 30, icon: CupertinoIcons.sun_max),
        //     WeatherItem(day: "SUN", temp: 29, icon: CupertinoIcons.cloud_sun_bolt),
        //     WeatherItem(day: "MON", temp: 29, icon: CupertinoIcons.cloud_sun),
        //   ],
        // ),
      ),
    );
  }
}
