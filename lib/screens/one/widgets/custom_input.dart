import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String label;
  final String value;
  final String? suffix;
  final Function(String) onChanged;
  final TextInputType? keyboardType;

  const CustomInput({
    Key? key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.suffix,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Arial',
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Color(0xFF1A1A1A),
            height: 1,
          ),
        ),
        const SizedBox(height: 7),
        Container(
          height: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xFFF3F3F5),
            border: Border.all(
              color: Colors.transparent,
              width: 1,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  initialValue: value,
                  onChanged: onChanged,
                  keyboardType: keyboardType,
                  style: const TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF717182),
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                    isDense: true,
                  ),
                ),
              ),
              if (suffix != null)
                Text(
                  suffix!,
                  style: const TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF6A7282),
                    height: 1,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
