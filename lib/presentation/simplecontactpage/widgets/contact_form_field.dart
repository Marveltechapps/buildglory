import 'package:flutter/material.dart';

class ContactFormField extends StatelessWidget {
  final String label;
  final bool isRequired;
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final TextInputType? keyboardType;
  final int maxLines;
  final double? height;

  const ContactFormField({
    Key? key,
    required this.label,
    required this.isRequired,
    required this.controller,
    required this.hintText,
    required this.icon,
    this.keyboardType,
    this.maxLines = 1,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth <= 640;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: Color(0xFF364153),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: 'Arial',
                height: 21 / 14,
              ),
            ),
            if (isRequired) ...[
              const SizedBox(width: 4),
              const Text(
                '*',
                style: TextStyle(
                  color: Color(0xFFFB2C36),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Arial',
                  height: 21 / 14,
                ),
              ),
            ],
          ],
        ),
        const SizedBox(height: 8),
        // Input Field
        Container(
          height: height ?? 49,
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            maxLines: maxLines,
            style: const TextStyle(
              color: Color(0xFF717182),
              fontSize: 12,
              fontFamily: 'Arial',
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                color: Color(0xFF717182),
                fontSize: 12,
                fontFamily: 'Arial',
              ),
              prefixIcon: Container(
                width: 17.5,
                height: 17.5,
                alignment: Alignment.center,
                child: Icon(icon, color: const Color(0xFF99A1AF), size: 17.5),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 10.5,
                vertical: maxLines > 1 ? 7 : 3.5,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.75),
                borderSide: const BorderSide(
                  color: Color(0xFFE5E7EB),
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.75),
                borderSide: const BorderSide(
                  color: Color(0xFFE5E7EB),
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.75),
                borderSide: const BorderSide(
                  color: Color(0xFF9810FA),
                  width: 1,
                ),
              ),
              filled: true,
              fillColor: Colors.white,
            ),
            validator: isRequired
                ? (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    }
                    if (label.contains('Email') && !value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  }
                : null,
          ),
        ),
      ],
    );
  }
}
