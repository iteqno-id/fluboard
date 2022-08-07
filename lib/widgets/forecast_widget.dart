import 'dart:async';

import 'package:fluboard/constants/app_config.dart';
import 'package:fluboard/data/model/common/result_state.dart';
import 'package:fluboard/data/provider/forecast_provider.dart';
import 'package:fluboard/widgets/forecast_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ForecastWidget extends StatefulWidget {
  const ForecastWidget({Key? key}) : super(key: key);

  @override
  State<ForecastWidget> createState() => _ForecastWidgetState();
}

class _ForecastWidgetState extends State<ForecastWidget> {
  late Timer timer;

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ForecastProvider>(
      builder: (BuildContext context, provider, _) {
        if (provider.state == ResultState.loading) {
          return const Center(child: CupertinoActivityIndicator());
        } else if (provider.state == ResultState.hasData) {
          return Row(
            children: [
              ForecastItemWidget(forecast: provider.forecast.list[1]),
              ForecastItemWidget(forecast: provider.forecast.list[2]),
              ForecastItemWidget(forecast: provider.forecast.list[3]),
              ForecastItemWidget(forecast: provider.forecast.list[4]),
            ],
          );
        } else {
          return Center(child: Text(provider.forecast.message));
        }
      },
    );
  }

  startTimer() {
    timer = Timer.periodic(const Duration(hours: AppConfig.forecastRefresh), (timer) {
      Provider.of<ForecastProvider>(context, listen: false).getWeather();
    });
  }
}
