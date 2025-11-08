import 'package:flutter/material.dart';

class CustomProgressBar extends StatelessWidget {
  final double progress;
  final Color backgroundColor;
  final Color progressColor;
  final double height;

  const CustomProgressBar({
    Key? key,
    required this.progress,
    this.backgroundColor = const Color(0xFFE5E7EB),
    this.progressColor = const Color(0xFF155DFC),
    this.height = 7.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(33554400),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: progress,
        child: Container(
          decoration: BoxDecoration(
            color: progressColor,
            borderRadius: BorderRadius.circular(33554400),
          ),
        ),
      ),
    );
  }
}
