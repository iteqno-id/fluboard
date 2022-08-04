import 'package:flutter/material.dart';

class WeatherItem extends StatelessWidget {
  const WeatherItem({
    Key? key,
    required this.icon,
    required this.temp,
    required this.day,
  }) : super(key: key);
  final String day;
  final IconData icon;
  final int temp;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(day),
          const SizedBox(height: 4),
          Icon(
            icon,
            size: 56,
          ),
          Text("$temp\u00B0"),
        ],
      ),
    );
  }
}
