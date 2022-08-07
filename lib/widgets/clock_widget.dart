import 'dart:async';

import 'package:fluboard/utils/extension.dart';
import 'package:flutter/material.dart';

class ClockWidget extends StatefulWidget {
  const ClockWidget({Key? key}) : super(key: key);

  @override
  State<ClockWidget> createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
  DateTime dateTime = DateTime.now();
  late Timer timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            dateTime.ashmm(),
            style: TextStyle(fontSize: 64, color: Colors.white, shadows: _buildShadow()),
          ),
          Container(
            margin: const EdgeInsets.only(top: 12),
            child: Column(
              children: [
                Text(
                  dateTime.asSecond(),
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(shadows: _buildShadow()),
                ),
                const SizedBox(height: 6),
                Text(
                  dateTime.asAmPm(),
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(shadows: _buildShadow()),
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  dateTime.asDay(),
                  style: TextStyle(shadows: _buildShadow()),
                ),
                Text(
                  dateTime.asDateMonthYear(),
                  style: TextStyle(fontSize: 24, shadows: _buildShadow()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildShadow() {
    return const [
      Shadow(
        offset: Offset(2.0, 2.0),
        blurRadius: 6.0,
        color: Color.fromARGB(255, 0, 0, 0),
      )
    ];
  }

  startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        dateTime = DateTime.now();
      });
    });
  }

  tick() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        dateTime = DateTime.now();
      });
    });
  }
}
