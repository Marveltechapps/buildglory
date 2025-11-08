import 'package:flutter/material.dart';

enum AmenityIcon {
  building,
  capacity,
  parking,
  star,
}

class AmenityCard extends StatelessWidget {
  final AmenityIcon icon;
  final String value;
  final String label;

  const AmenityCard({
    Key? key,
    required this.icon,
    required this.value,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth <= 640;

    return Container(
      width: isMobile ? double.infinity : 67,
      height: isMobile ? 60 : 74,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.75),
        gradient: const LinearGradient(
          colors: [Color(0xFFEFF6FF), Color(0xFFEEF2FF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          // Icon
          Positioned(
            left: isMobile ? 8 : 22,
            top: isMobile ? 8 : 11,
            child: SizedBox(
              width: 18,
              height: 18,
              child: CustomPaint(
                painter: _getIconPainter(icon),
              ),
            ),
          ),
          // Value
          Positioned(
            left: isMobile ? 8 : 11,
            top: isMobile ? 26 : 32,
            width: isMobile ? null : 40,
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Arial',
                fontSize: 12,
                fontWeight: FontWeight.w700,
                height: 17.5/12,
                color: Color(0xFF0A0A0A),
              ),
            ),
          ),
          // Label
          Positioned(
            left: isMobile ? 8 : 11,
            top: isMobile ? 40 : 49,
            width: isMobile ? null : 40,
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Arial',
                fontSize: 10.5,
                fontWeight: FontWeight.w400,
                height: 14/10.5,
                color: Color(0xFF6A7282),
              ),
            ),
          ),
        ],
      ),
    );
  }

  CustomPainter _getIconPainter(AmenityIcon icon) {
    switch (icon) {
      case AmenityIcon.building:
        return BuildingIconPainter();
      case AmenityIcon.capacity:
        return CapacityIconPainter();
      case AmenityIcon.parking:
        return ParkingIconPainter();
      case AmenityIcon.star:
        return StarIconPainter();
    }
  }
}

class BuildingIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF155DFC)
      ..strokeWidth = 1.45833
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;

    // Main building
    final path1 = Path();
    path1.moveTo(5, 16.0413);
    path1.lineTo(5, 2.91634);
    path1.cubicTo(5, 2.52957, 5.15365, 2.15863, 5.42714, 1.88514);
    path1.cubicTo(5.70063, 1.61165, 6.07156, 1.45801, 6.45833, 1.45801);
    path1.lineTo(12.2917, 1.45801);
    path1.cubicTo(12.6784, 1.45801, 13.0494, 1.61165, 13.3229, 1.88514);
    path1.cubicTo(13.5964, 2.15863, 13.75, 2.52957, 13.75, 2.91634);
    path1.lineTo(13.75, 16.0413);
    path1.lineTo(5, 16.0413);

    canvas.drawPath(path1, paint);

    // Left extension
    final path2 = Path();
    path2.moveTo(4.99998, 8.75);
    path2.lineTo(3.54165, 8.75);
    path2.cubicTo(3.15487, 8.75, 2.78394, 8.90365, 2.51045, 9.17714);
    path2.cubicTo(2.23696, 9.45063, 2.08331, 9.82156, 2.08331, 10.2083);
    path2.lineTo(2.08331, 14.5833);
    path2.cubicTo(2.08331, 14.9701, 2.23696, 15.341, 2.51045, 15.6145);
    path2.cubicTo(2.78394, 15.888, 3.15487, 16.0417, 3.54165, 16.0417);
    path2.lineTo(4.99998, 16.0417);

    canvas.drawPath(path2, paint);

    // Right extension
    final path3 = Path();
    path3.moveTo(13.75, 6.5625);
    path3.lineTo(15.2083, 6.5625);
    path3.cubicTo(15.5951, 6.5625, 15.966, 6.71615, 16.2395, 6.98964);
    path3.cubicTo(16.513, 7.26313, 16.6667, 7.63406, 16.6667, 8.02083);
    path3.lineTo(16.6667, 14.5833);
    path3.cubicTo(16.6667, 14.9701, 16.513, 15.341, 16.2395, 15.6145);
    path3.cubicTo(15.966, 15.888, 15.5951, 16.0417, 15.2083, 16.0417);
    path3.lineTo(13.75, 16.0417);

    canvas.drawPath(path3, paint);

    // Horizontal lines
    final lines = [
      [Offset(7.91669, 4.375), Offset(10.8334, 4.375)],
      [Offset(7.91669, 7.29199), Offset(10.8334, 7.29199)],
      [Offset(7.91669, 10.208), Offset(10.8334, 10.208)],
      [Offset(7.91669, 13.125), Offset(10.8334, 13.125)],
    ];

    for (final line in lines) {
      canvas.drawLine(line[0], line[1], paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class CapacityIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF155DFC)
      ..strokeWidth = 1.45833
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;

    // Main person group
    final path1 = Path();
    path1.moveTo(12.0416, 15.3125);
    path1.lineTo(12.0416, 13.8542);
    path1.cubicTo(12.0416, 13.0806, 11.7344, 12.3388, 11.1874, 11.7918);
    path1.cubicTo(10.6404, 11.2448, 9.89853, 10.9375, 9.12498, 10.9375);
    path1.lineTo(4.74998, 10.9375);
    path1.cubicTo(3.97643, 10.9375, 3.23457, 11.2448, 2.68758, 11.7918);
    path1.cubicTo(2.1406, 12.3388, 1.83331, 13.0806, 1.83331, 13.8542);
    path1.lineTo(1.83331, 15.3125);

    canvas.drawPath(path1, paint);

    // Additional person outline
    final path2 = Path();
    path2.moveTo(12.0417, 2.28125);
    path2.cubicTo(12.6671, 2.44339, 13.221, 2.80863, 13.6165, 3.31963);
    path2.cubicTo(14.0119, 3.83063, 14.2264, 4.45846, 14.2264, 5.10458);
    path2.cubicTo(14.2264, 5.75071, 14.0119, 6.37854, 13.6165, 6.88954);
    path2.cubicTo(13.221, 7.40054, 12.6671, 7.76577, 12.0417, 7.92792);

    canvas.drawPath(path2, paint);

    // Additional person bottom
    final path3 = Path();
    path3.moveTo(16.4167, 15.3124);
    path3.lineTo(16.4167, 13.8541);
    path3.cubicTo(16.4162, 13.2079, 16.2011, 12.5801, 15.8052, 12.0693);
    path3.cubicTo(15.4093, 11.5586, 14.8549, 11.1938, 14.2292, 11.0322);

    canvas.drawPath(path3, paint);

    // Main person circle
    final center = Offset(6.93748, 5.10417);
    final radius = 2.91667;
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class ParkingIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF155DFC)
      ..strokeWidth = 1.45833
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;

    // Parking rectangle
    final rect = RRect.fromRectAndRadius(
      const Rect.fromLTWH(2.3125, 2.1875, 13.125, 13.125),
      const Radius.circular(0),
    );
    canvas.drawRRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class StarIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF155DFC)
      ..strokeWidth = 1.45833
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(9.27866, 1.67303);
    path.cubicTo(9.31061, 1.60847, 9.35997, 1.55413, 9.42117, 1.51614);
    path.cubicTo(9.48237, 1.47814, 9.55297, 1.45801, 9.62501, 1.45801);
    path.cubicTo(9.69704, 1.45801, 9.76765, 1.47814, 9.82885, 1.51614);
    path.cubicTo(9.89005, 1.55413, 9.93941, 1.60847, 9.97136, 1.67303);
    path.lineTo(11.6557, 5.08481);
    path.cubicTo(11.7667, 5.30936, 11.9305, 5.50364, 12.1331, 5.65097);
    path.cubicTo(12.3356, 5.79829, 12.5709, 5.89426, 12.8188, 5.93064);
    path.lineTo(16.5856, 6.48189);
    path.cubicTo(16.657, 6.49223, 16.7241, 6.52234, 16.7792, 6.5688);
    path.cubicTo(16.8344, 6.61527, 16.8754, 6.67625, 16.8977, 6.74483);
    path.cubicTo(16.92, 6.81342, 16.9227, 6.88687, 16.9054, 6.95689);
    path.cubicTo(16.8882, 7.02692, 16.8516, 7.09071, 16.8, 7.14106);
    path.lineTo(14.0758, 9.79376);
    path.cubicTo(13.8962, 9.96884, 13.7618, 10.1849, 13.6842, 10.4235);
    path.cubicTo(13.6066, 10.662, 13.5881, 10.9159, 13.6303, 11.1631);
    path.lineTo(14.2734, 14.9111);
    path.cubicTo(14.286, 14.9824, 14.2783, 15.0558, 14.2512, 15.123);
    path.cubicTo(14.2241, 15.1902, 14.1786, 15.2484, 14.12, 15.2909);
    path.cubicTo(14.0614, 15.3335, 13.992, 15.3588, 13.9197, 15.3638);
    path.cubicTo(13.8474, 15.3688, 13.7752, 15.3534, 13.7113, 15.3194);
    path.lineTo(10.344, 13.549);
    path.cubicTo(10.1221, 13.4325, 9.87525, 13.3716, 9.62465, 13.3716);
    path.cubicTo(9.37405, 13.3716, 9.12719, 13.4325, 8.90532, 13.549);
    path.lineTo(5.53876, 15.3194);
    path.cubicTo(5.47483, 15.3532, 5.4027, 15.3685, 5.33055, 15.3633);
    path.cubicTo(5.2584, 15.3582, 5.18914, 15.3329, 5.13064, 15.2904);
    path.cubicTo(5.07215, 15.2478, 5.02676, 15.1897, 4.99966, 15.1227);
    path.cubicTo(4.97255, 15.0556, 4.9648, 14.9823, 4.9773, 14.9111);
    path.lineTo(5.6197, 11.1639);
    path.cubicTo(5.66213, 10.9165, 5.64375, 10.6625, 5.56613, 10.4238);
    path.cubicTo(5.48851, 10.1851, 5.354, 9.96888, 5.17418, 9.79376);
    path.lineTo(2.45001, 7.14178);
    path.cubicTo(2.39794, 7.0915, 2.36105, 7.02759, 2.34352, 6.95736);
    path.cubicTo(2.326, 6.88712, 2.32856, 6.81338, 2.3509, 6.74453);
    path.cubicTo(2.37324, 6.67567, 2.41448, 6.61448, 2.4699, 6.56792);
    path.cubicTo(2.52532, 6.52135, 2.59271, 6.49129, 2.66439, 6.48116);
    path.lineTo(6.43053, 5.93064);
    path.cubicTo(6.67863, 5.89454, 6.91425, 5.7987, 7.1171, 5.65136);
    path.cubicTo(7.31995, 5.50402, 7.48396, 5.30959, 7.59501, 5.08481);
    path.lineTo(9.27866, 1.67303);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
