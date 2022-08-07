import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberField extends StatelessWidget {
  const NumberField({
    Key? key,
    required this.controller,
    this.suffixText = "",
  }) : super(key: key);

  final TextEditingController controller;
  final String suffixText;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      style: const TextStyle(color: Colors.white),
      suffix: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Text(suffixText),
      ),
    );
  }
}
