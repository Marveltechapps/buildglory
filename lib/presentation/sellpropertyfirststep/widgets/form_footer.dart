import 'package:flutter/material.dart';

class FormFooter extends StatelessWidget {
  final VoidCallback onContinuePressed;

  const FormFooter({
    Key? key,
    required this.onContinuePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Color(0x1A000000),
            width: 1,
          ),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(18, 19, 17, 19),
      child: SizedBox(
        width: double.infinity,
        height: 42,
        child: ElevatedButton(
          onPressed: onContinuePressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF155DFC),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
            ),
            elevation: 0,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          ),
          child: const Text(
            'Continue',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Colors.white,
              height: 1.0,
            ),
          ),
        ),
      ),
    );
  }
}
