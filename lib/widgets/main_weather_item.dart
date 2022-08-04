import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainWeatherItem extends StatelessWidget {
  const MainWeatherItem({
    Key? key,
    required this.icon,
    required this.temp,
    required this.windSpeed,
  }) : super(key: key);
  final IconData icon;
  final int temp;
  final int windSpeed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(
            icon,
            size: 84,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(CupertinoIcons.thermometer),
              const SizedBox(width: 4),
              Text("$temp\u00B0"),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(CupertinoIcons.wind),
              SizedBox(width: 4),
              Text("$windSpeed kmph"),
            ],
          ),
        ],
      ),
    );
  }
}
