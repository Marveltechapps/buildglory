import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final Color? borderColor;
  final Widget? icon;
  final double? fontSize;
  final double? height;
  final VoidCallback? onPressed;

  const CustomButton({
    Key? key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    this.borderColor,
    this.icon,
    this.fontSize = 12,
    this.height,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width <= 640;

    return Container(
      height: height ?? (isMobile ? 32 : 28),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          elevation: 0,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 16 : 12,
            vertical: isMobile ? 8 : 4,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.75),
            side: borderColor != null
                ? BorderSide(color: borderColor!, width: 1)
                : BorderSide.none,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              icon!,
              const SizedBox(width: 8),
            ],
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: fontSize,
                fontWeight: FontWeight.w400,
                height: 17.5 / (fontSize ?? 12),
                fontFamily: 'Arial',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
