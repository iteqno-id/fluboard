import 'package:flutter/material.dart';

class RightGradientWidget extends StatelessWidget {
  const RightGradientWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 100,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [
            Colors.black.withOpacity(1),
            Colors.black.withOpacity(0.6),
            Colors.black.withOpacity(0.3),
            Colors.black.withOpacity(0.1),
            Colors.black.withOpacity(0.0),
            Colors.black.withOpacity(0.0),
          ],
        ),
      ),
    );
  }
}
