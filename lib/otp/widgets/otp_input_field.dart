import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpInputField extends StatelessWidget {
  final String value;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;

  const OtpInputField({
    Key? key,
    required this.value,
    this.onChanged,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          border: Border.all(
            color: const Color(0xFFD1D5DC),
            width: 1,
          ),
        ),
        child: Center(
          child: Text(
            value,
            style: const TextStyle(
              color: Color(0xFF0A0A0A),
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontFamily: 'Arial',
              height: 2,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
