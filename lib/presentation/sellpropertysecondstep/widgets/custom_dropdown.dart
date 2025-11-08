import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final String placeholder;
  final String? value;
  final List<String> items;
  final ValueChanged<String?>? onChanged;

  const CustomDropdown({
    Key? key,
    required this.placeholder,
    this.value,
    required this.items,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      decoration: BoxDecoration(
        color: const Color(0xFFF3F3F5),
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color: Colors.transparent,
          width: 1,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          hint: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 11),
            child: Text(
              placeholder,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF717182),
                fontFamily: 'Arial',
              ),
            ),
          ),
          icon: const Padding(
            padding: EdgeInsets.only(right: 11),
            child: Icon(
              Icons.keyboard_arrow_down,
              size: 14,
              color: Color(0xFF717182),
            ),
          ),
          isExpanded: true,
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 11),
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF0A0A0A),
                    fontFamily: 'Arial',
                  ),
                ),
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
