import 'package:buildglory/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterDropdown extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;

  const FilterDropdown({Key? key, required this.label, this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        height: 34,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF353535),
                  fontFamily: 'Arial',
                ),
              ),
            ),
            SvgPicture.asset(dropdownIcon, width: 14, height: 14),
          ],
        ),
      ),
    );
  }
}
