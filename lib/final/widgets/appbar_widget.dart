import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  const AppbarWidget({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: subtitle == ""
          ? Text(
              title,
              style: TextStyle(
                color: Color(0xFF1A1A1A),
                fontSize: 18,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.35,
                fontFamily: 'Arial',
                height: 1,
              ),
            )
          : ListTile(
              title: Text(
                title,
                style: TextStyle(
                  color: Color(0xFF1A1A1A),
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.35,
                  fontFamily: 'Arial',
                  height: 1,
                ),
              ),
              subtitle: Text(subtitle),
            ),
    );
  }
}
