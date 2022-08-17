import 'dart:io';

import 'package:fluboard/constants/app_config.dart';
import 'package:fluboard/data/model/google/local_access_token.dart';
import 'package:fluboard/data/model/google/local_album.dart';
import 'package:fluboard/data/model/google/photo_item.dart';
import 'package:fluboard/data/provider/access_token_provider.dart';
import 'package:fluboard/data/provider/current_weather_provider.dart';
import 'package:fluboard/data/provider/forecast_provider.dart';
import 'package:fluboard/data/provider/people_provider.dart';
import 'package:fluboard/di/injector.dart' as injector;
import 'package:fluboard/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  injector.init();
  await Hive.initFlutter();
  Hive.registerAdapter(LocalAccessTokenAdapter());
  Hive.registerAdapter(LocalAlbumAdapter());
  Hive.registerAdapter(PhotoItemAdapter());
  await Hive.openBox(AppConfig.dbSettings);
  await Hive.openBox<PhotoItem>(AppConfig.photoBox);

  if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
    await windowManager.ensureInitialized();
    await windowManager.setFullScreen(false);
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
              ChangeNotifierProvider(create: (_) => AccessTokenProvider()),
              ChangeNotifierProvider(create: (_) => PeopleProvider()),
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
