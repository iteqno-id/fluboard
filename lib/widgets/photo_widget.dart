import 'dart:async';

import 'package:fluboard/constants/app_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

class PhotoWidget extends StatefulWidget {
  const PhotoWidget({Key? key}) : super(key: key);

  @override
  State<PhotoWidget> createState() => _PhotoWidgetState();
}

class _PhotoWidgetState extends State<PhotoWidget> {
  int selectedPhoto = 0;
  late Timer timer;
  var box = Hive.box(AppConfig.dbSettings);

  @override
  void initState() {
    tick();
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Image.network(
      "${photos[selectedPhoto]}?w=987&q=80",
      fit: BoxFit.cover,
      height: MediaQuery.of(context).size.height,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return const Center(child: CupertinoActivityIndicator());
      },
    );
  }

  List<String> photos = [
    "https://images.unsplash.com/photo-1559494007-9f5847c49d94",
    "https://images.unsplash.com/photo-1615729947596-a598e5de0ab3",
    "https://images.unsplash.com/photo-1534570122623-99e8378a9aa7",
    "https://images.unsplash.com/photo-1494459940152-1e911caa8cc5",
    "https://images.unsplash.com/photo-1512100356356-de1b84283e18",
    "https://images.unsplash.com/photo-1589182373726-e4f658ab50f0",
    "https://images.unsplash.com/photo-1455305049585-41b8d277d68a",
    "https://images.unsplash.com/photo-1476041026529-411f6ae1de3e",
    "https://images.unsplash.com/photo-1536152470836-b943b246224c",
    "https://images.unsplash.com/photo-1519501025264-65ba15a82390",
    "https://images.unsplash.com/photo-1502899576159-f224dc2349fa",
  ];

  tick() {
    timer = Timer.periodic(
        Duration(seconds: box.get(AppConfig.photoDoc, defaultValue: AppConfig.photoRefresh)),
        (timer) {
      if (selectedPhoto == photos.length - 1) {
        selectedPhoto = 0;
      } else {
        selectedPhoto++;
      }
      setState(() {});
    });
  }
}
