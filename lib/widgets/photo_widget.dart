import 'dart:async';
import 'dart:math';

import 'package:fluboard/constants/app_config.dart';
import 'package:fluboard/data/model/common/result_state.dart';
import 'package:fluboard/data/model/google/photo_item.dart';
import 'package:fluboard/data/provider/photos_provider.dart';
import 'package:fluboard/data/repository/app_repository.dart';
import 'package:fluboard/di/injector.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

Timer? photoTimer;

class PhotoWidget extends StatefulWidget {
  const PhotoWidget({Key? key}) : super(key: key);

  @override
  State<PhotoWidget> createState() => _PhotoWidgetState();
}

class _PhotoWidgetState extends State<PhotoWidget> {
  final repo = getIt<AppRepository>();
  late PhotoItem selectedPhoto;
  int dummy = 0;

  @override
  void initState() {
    tick();
    super.initState();
  }

  @override
  void dispose() {
    photoTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PhotosProvider>(
      builder: (BuildContext context, provider, _) {
        if (provider.state == ResultState.loading) {
          return const Center(child: CupertinoActivityIndicator());
        } else if (provider.state == ResultState.hasData) {
          return Image.network(
            provider.photo.photoLarge(),
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return const Center(child: CupertinoActivityIndicator());
            },
            errorBuilder: (context, Object e, StackTrace? stack) {
              // final error = e as NetworkImageLoadException;
              // debugPrint(error.statusCode.toString());
              // debugPrint(error.uri.toString());
              // if (error.statusCode == 403) {
              refreshPhoto();
              // }
              return const Center(child: Text('Error occurred'));
            },
          );
        } else {
          return Center(
            child: Image.network(
              unsplashRandom().baseUrl,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return const Center(child: CupertinoActivityIndicator());
              },
            ),
          );
        }
      },
    );
  }

  refreshPhoto() {
    repo.refreshPhoto().then((value) => nextPhoto());
  }

  nextPhoto() {
    Provider.of<PhotosProvider>(context, listen: false).refreshPhoto();
  }

  PhotoItem unsplashRandom() {
    int random = Random(0).nextInt(photos.length - 1);
    return PhotoItem("$random", "${photos[random]}?", "", "", "");
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
    // timer?.cancel();
    photoTimer?.cancel();
    photoTimer = Timer.periodic(
        Duration(
          seconds: repo.getConfig(AppConfig.photoDoc, AppConfig.photoRefresh),
        ), (timer) {
      nextPhoto();
    });
  }
}
