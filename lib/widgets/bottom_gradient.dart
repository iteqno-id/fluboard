import 'package:flutter/material.dart';

class BottomGradientWidget extends StatelessWidget {
  const BottomGradientWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Colors.black,
            Colors.black38,
            Colors.black.withOpacity(0),
          ],
        ),
      ),
    );
  }
}
