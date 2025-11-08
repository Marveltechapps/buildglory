import 'package:flutter/material.dart';

class LocationInfoCard extends StatelessWidget {
  final String location;

  const LocationInfoCard({
    Key? key,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFFEFF6FF),
      ),
      padding: const EdgeInsets.fromLTRB(11, 11, 10, 11),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Searching in',
            style: TextStyle(
              fontSize: 12,
              color: Color(0xFF155DFC),
              fontWeight: FontWeight.w400,
              height: 1.0,
              fontFamily: 'Arial',
            ),
          ),
          const SizedBox(height: 4),
          Text(
            location,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xFF193CB8),
              fontWeight: FontWeight.w400,
              fontFamily: 'Arial',
            ),
          ),
        ],
      ),
    );
  }
}
