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
      ),
    );
  }
}
