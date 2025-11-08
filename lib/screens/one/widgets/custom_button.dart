import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final Color? borderColor;
  final double? width;
  final double? height;
  final double fontSize;
  final EdgeInsets? padding;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    required this.textColor,
    this.borderColor,
    this.width,
    this.height,
    this.fontSize = 14,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: backgroundColor,
          border: borderColor != null
              ? Border.all(color: borderColor!, width: 1)
              : null,
        ),
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Arial',
              fontSize: fontSize,
              fontWeight: FontWeight.w400,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
