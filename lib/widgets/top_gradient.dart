import 'package:flutter/material.dart';

class TopGradientWidget extends StatelessWidget {
  const TopGradientWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black87,
            Colors.black38,
            Colors.black.withOpacity(0),
          ],
        ),
      ),
    );
  }
}
