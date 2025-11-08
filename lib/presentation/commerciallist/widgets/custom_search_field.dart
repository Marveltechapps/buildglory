import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 991;
    final isMobile = screenWidth <= 640;

    return Container(
      width: isTablet ? double.infinity : 342,
      height: isMobile ? 38 : 42,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 12 : 10.5,
        vertical: isMobile ? 8 : 3.5,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(12.75),
        border: Border.all(
          color: const Color(0xFFE5E7EB),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 17.5,
            height: 17.5,
            child: CustomPaint(
              painter: SearchIconPainter(),
            ),
          ),
          const SizedBox(width: 8),
          const Text(
            'Search commercial spaces...',
            style: TextStyle(
              fontFamily: 'Arial',
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xFF717182),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF99A1AF)
      ..strokeWidth = 1.45833
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;

    // Search circle
    final center = Offset(8.02083, 8.27083);
    final radius = 5.83333;
    canvas.drawCircle(center, radius, paint);

    // Search handle
    final path = Path();
    path.moveTo(15.3125, 15.562);
    path.lineTo(12.1479, 12.3975);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
