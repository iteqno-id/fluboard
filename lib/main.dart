import 'dart:io';

import 'package:fluboard/constants/app_config.dart';
import 'package:fluboard/data/provider/current_weather_provider.dart';
import 'package:fluboard/data/provider/forecast_provider.dart';
import 'package:fluboard/di/injector.dart' as injector;
import 'package:fluboard/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  injector.init();
  await Hive.initFlutter();
  await Hive.openBox(AppConfig.dbSettings);

  if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
    await windowManager.ensureInitialized();
    await windowManager.setFullScreen(true);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Hive.box(AppConfig.dbSettings).listenable(),
        builder: (context, Box box, _) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => ForecastProvider().getWeather()),
              ChangeNotifierProvider(create: (_) => CurrentWeatherProvider().getCurrentWeather()),
            ],
            child: MaterialApp(
              title: 'Fluboard',
              debugShowCheckedModeBanner: false,
              theme: ThemeData.dark(),
              home: const HomeScreen(),
            ),
          );
        });
  }
}
