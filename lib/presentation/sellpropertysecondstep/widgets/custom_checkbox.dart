import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?>? onChanged;
  final String label;

  const CustomCheckbox({
    Key? key,
    required this.value,
    this.onChanged,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => onChanged?.call(!value),
          child: Container(
            width: 14,
            height: 14,
            decoration: BoxDecoration(
              color: const Color(0xFFF3F3F5),
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: const Color(0x1A000000),
                width: 1,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x0D000000),
                  offset: Offset(0, 1),
                  blurRadius: 2,
                ),
              ],
            ),
            child: value
                ? const Icon(
                    Icons.check,
                    size: 10,
                    color: Color(0xFF155DFC),
                  )
                : null,
          ),
        ),
        const SizedBox(width: 7),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Color(0xFF0A0A0A),
              fontFamily: 'Arial',
              height: 1.0,
            ),
          ),
        ),
      ],
    );
  }
}
