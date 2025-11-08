import 'package:flutter/material.dart';

class PropertyFeatureCard extends StatelessWidget {
  final String iconSvg;
  final String value;
  final String label;

  const PropertyFeatureCard({
    Key? key,
    required this.iconSvg,
    required this.value,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 76,
      height: 126,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.75),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFFAF5FF),
            Color(0xFFFDF2F8),
          ],
        ),
      ),
      child: Stack(
        children: [
          // Icon
          Positioned(
            left: 23,
            top: 14,
            child: SizedBox(
              width: 25,
              height: 25,
              child: CustomPaint(
                painter: SvgIconPainter(iconSvg),
              ),
            ),
          ),
          // Value
          Positioned(
            left: 14,
            top: 49,
            child: SizedBox(
              width: 42,
              height: 25,
              child: Container(
                padding: const EdgeInsets.only(bottom: 2.5),
                child: Stack(
                  children: [
                    Positioned(
                      left: value.contains('\n') ? 2 : 17,
                      top: -3,
                      child: SizedBox(
                        width: value.contains('\n') ? 42 : null,
                        height: value.contains('\n') ? 49 : 25,
                        child: Text(
                          value,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Color(0xFF0A0A0A),
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Arial',
                            height: 1.53,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Label
          Positioned(
            left: 14,
            top: value.contains('\n') ? 98 : 74,
            child: SizedBox(
              width: 42,
              height: 14,
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF6A7282),
                  fontSize: 10.5,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Arial',
                  height: 1.33,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SvgIconPainter extends CustomPainter {
  final String svgData;

  SvgIconPainter(this.svgData);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF9810FA)
      ..strokeWidth = 2.04167
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    // Bedroom icon paths
    if (svgData.contains('M2.54175 4.58301V20.9163')) {
      // Vertical line
      canvas.drawLine(
        const Offset(2.54175, 4.58301),
        const Offset(2.54175, 20.9163),
        paint,
      );

      // Horizontal line at top
      canvas.drawLine(
        const Offset(2.54175, 8.66699),
        const Offset(20.9167, 8.66699),
        paint,
      );

      // Rectangle outline
      final rect = RRect.fromRectAndRadius(
        const Rect.fromLTWH(2.54175, 8.66699, 18.375, 12.25),
        const Radius.circular(2),
      );
      canvas.drawRRect(rect, paint);

      // Bottom horizontal line
      canvas.drawLine(
        const Offset(2.54175, 17.8545),
        const Offset(22.9584, 17.8545),
        paint,
      );

      // Vertical divider
      canvas.drawLine(
        const Offset(6.625, 8.66699),
        const Offset(6.625, 17.8545),
        paint,
      );
    }
    // Bathroom icon paths
    else if (svgData.contains('M10.4584 4.58301L8.41675 6.62467')) {
      // Shower head lines
      canvas.drawLine(
        const Offset(10.4584, 4.58301),
        const Offset(8.41675, 6.62467),
        paint,
      );

      // Vertical lines
      canvas.drawLine(
        const Offset(17.6042, 19.8955),
        const Offset(17.6042, 21.9372),
        paint,
      );

      canvas.drawLine(
        const Offset(7.39575, 19.8955),
        const Offset(7.39575, 21.9372),
        paint,
      );

      // Horizontal line
      canvas.drawLine(
        const Offset(2.29175, 12.75),
        const Offset(22.7084, 12.75),
        paint,
      );

      // Bathtub outline
      final path = Path();
      path.moveTo(9.43742, 5.60405);
      path.lineTo(8.02969, 4.19632);
      path.cubicTo(7.73448, 3.89973, 7.35965, 3.69505, 6.95055, 3.60703);
      path.cubicTo(6.54145, 3.51901, 6.1156, 3.55143, 5.72454, 3.70036);
      path.cubicTo(5.33347, 3.84929, 4.99395, 4.10835, 4.74703, 4.44621);
      path.cubicTo(4.50012, 4.78406, 4.35639, 5.18622, 4.33325, 5.60405);
      path.lineTo(4.33325, 17.854);
      path.cubicTo(4.33325, 18.3955, 4.54836, 18.9148, 4.93124, 19.2977);
      path.cubicTo(5.31413, 19.6806, 5.83343, 19.8957, 6.37492, 19.8957);
      path.lineTo(18.6249, 19.8957);
      path.cubicTo(19.1664, 19.8957, 19.6857, 19.6806, 20.0686, 19.2977);
      path.cubicTo(20.4515, 18.9148, 20.6666, 18.3955, 20.6666, 17.854);
      path.lineTo(20.6666, 12.7499);
      canvas.drawPath(path, paint);
    }
    // Square footage icon (rectangle)
    else if (svgData.contains('M19.3958 3.5625H5.10417')) {
      final rect = RRect.fromRectAndRadius(
        const Rect.fromLTWH(3.0625, 3.5625, 18.375, 18.375),
        const Radius.circular(2),
      );
      canvas.drawRRect(rect, paint);
    }
    // Acres icon (tree)
    else if (svgData.contains('M18.1042 14.7917L21.1667 18.1604')) {
      // Tree trunk
      canvas.drawLine(
        const Offset(13, 22.958),
        const Offset(13, 19.8955),
        paint,
      );

      // Tree canopy - complex path
      final path = Path();
      path.moveTo(18.1042, 14.7917);
      path.lineTo(21.1667, 18.1604);
      path.cubicTo(21.3066, 18.3031, 21.4016, 18.4837, 21.4398, 18.6798);
      path.cubicTo(21.478, 18.876, 21.4579, 19.079, 21.3818, 19.2638);
      path.cubicTo(21.3057, 19.4486, 21.177, 19.6069, 21.0118, 19.7193);
      path.cubicTo(20.8466, 19.8316, 20.652, 19.893, 20.4522, 19.8958);
      path.lineTo(5.548, 19.8958);
      path.cubicTo(5.34819, 19.893, 5.15361, 19.8316, 4.98836, 19.7193);
      path.cubicTo(4.82312, 19.6069, 4.69448, 19.4486, 4.6184, 19.2638);
      path.cubicTo(4.54231, 19.079, 4.52213, 18.876, 4.56035, 18.6798);
      path.cubicTo(4.59858, 18.4837, 4.69352, 18.3031, 4.83342, 18.1604);
      path.lineTo(7.89592, 14.7917);

      // Continue with the complex tree shape
      path.lineTo(13.0001, 3.5625);
      path.lineTo(17.0834, 7.95208);
      path.close();

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
