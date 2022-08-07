import 'package:fluboard/screen/settings_screen.dart';
import 'package:flutter/material.dart';

class SettingsButton extends StatefulWidget {
  const SettingsButton({Key? key}) : super(key: key);

  @override
  State<SettingsButton> createState() => _SettingsButtonState();
}

class _SettingsButtonState extends State<SettingsButton> {
  bool visible = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (_) => setState(() => visible = true),
      onExit: (_) => setState(() => visible = false),
      child: visible
          ? InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsScreen()));
              },
              child: Container(
                margin: const EdgeInsets.all(4),
                padding: const EdgeInsets.only(left: 12),
                decoration:
                    BoxDecoration(color: Colors.white12, borderRadius: BorderRadius.circular(16)),
                child: Row(
                  children: [
                    const Text('Settings'),
                    IconButton(
                      icon: const Icon(Icons.settings),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            )
          : const SizedBox(width: 100, height: 50),
    );
  }
}
