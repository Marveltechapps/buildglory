import 'package:flutter/material.dart';

class FormCard extends StatelessWidget {
  final String title;
  final Widget child;
  final bool isRequired;

  const FormCard({
    Key? key,
    required this.title,
    required this.child,
    this.isRequired = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        border: Border.all(
          color: const Color(0x1A000000),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isRequired ? '$title *' : title,
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF0A0A0A),
                fontFamily: 'Arial',
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 12),
            child,
          ],
        ),
      ),
    );
  }
}
