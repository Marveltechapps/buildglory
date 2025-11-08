import 'package:flutter/material.dart';

class FormCard extends StatelessWidget {
  final Widget child;

  const FormCard({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: Border.all(
          color: const Color(0x1A000000),
          width: 1,
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: child,
    );
  }
}
