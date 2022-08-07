import 'package:fluboard/widgets/bottom_gradient.dart';
import 'package:fluboard/widgets/calendar_widget.dart';
import 'package:fluboard/widgets/clock_widget.dart';
import 'package:fluboard/widgets/photo_widget.dart';
import 'package:fluboard/widgets/right_gradient.dart';
import 'package:fluboard/widgets/top_gradient.dart';
import 'package:fluboard/widgets/weather_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: const [
                PhotoWidget(),
                TopGradientWidget(),
                Align(
                  alignment: Alignment.centerRight,
                  child: RightGradientWidget(),
                ),
                ClockWidget(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: BottomGradientWidget(),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: WeatherWidget(),
                ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 3 * 2,
            child: Stack(
              children: [
                const CalendarWidget(),
                Positioned(
                  left: -1,
                  child: Container(
                    width: 2,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
