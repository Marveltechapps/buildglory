import 'package:flutter/material.dart';

class OffersCard extends StatelessWidget {
  const OffersCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 334,
      height: 124,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.75),
        border: Border.all(color: Colors.black.withOpacity(0.1)),
        gradient: const LinearGradient(
          colors: [Color(0xFFE17100), Color(0xFFF54900)],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(14, 14, 14, 21),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white.withOpacity(0.2),
                  ),
                  child: const Icon(
                    Icons.flash_on_outlined,
                    color: Colors.white,
                    size: 21,
                  ),
                ),
                const SizedBox(width: 10.5),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Limited Time Offers',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 3.5),
                      const Text(
                        'Pre-approved loans with zero processing fee',
                        style: TextStyle(
                          color: Color(0xFFFEF3C6),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          height: 1.46,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 28,
                padding: const EdgeInsets.symmetric(horizontal: 11),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.75),
                  color: Colors.white,
                ),
                child: const Center(
                  child: Text(
                    'View Offers',
                    style: TextStyle(
                      color: Color(0xFFE17100),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      height: 1.46,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
