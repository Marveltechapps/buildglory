import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final bool isRequired;
  final TextEditingController controller;
  final String iconUrl;
  final String? hintText;
  final TextInputType keyboardType;

  const CustomInputField({
    Key? key,
    required this.label,
    this.isRequired = false,
    required this.controller,
    required this.iconUrl,
    this.hintText,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Row(
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Color(0xFF364153),
                fontFamily: 'Arial',
              ),
            ),
            if (isRequired) ...[
              const SizedBox(width: 4),
              const Text(
                '*',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFfb2c36),
                  fontFamily: 'Arial',
                ),
              ),
            ],
          ],
        ),
        const SizedBox(height: 8),

        // Input Field
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                SvgPicture.asset(iconUrl, width: 18, height: 18),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    controller: controller,
                    keyboardType: keyboardType,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF717182),
                      fontFamily: 'Arial',
                    ),
                    validator: isRequired
                        ? (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter $label';
                            }
                            return null;
                          }
                        : null,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
