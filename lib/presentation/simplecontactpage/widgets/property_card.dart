import 'package:flutter/material.dart';

class PropertyCard extends StatelessWidget {
  const PropertyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth <= 640;

    return Container(
      height: isSmallScreen ? null : 237,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.75),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, 10),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Property Image
          Container(
            height: isSmallScreen ? 100 : 112,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.75),
                topRight: Radius.circular(12.75),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12.75),
                topRight: Radius.circular(12.75),
              ),
              child: Image.network(
                'https://api.builder.io/api/v1/image/assets/TEMP/68d7e42f4b54f135b6f3d0751e75fa447b7360c4?width=690',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: const Icon(
                      Icons.image_not_supported,
                      color: Colors.grey,
                      size: 40,
                    ),
                  );
                },
              ),
            ),
          ),
          // Property Details
          Container(
            padding: EdgeInsets.all(isSmallScreen ? 12 : 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Property Title
                Text(
                  'Phoenix Meadows Villa',
                  style: TextStyle(
                    color: const Color(0xFF0A0A0A),
                    fontSize: isSmallScreen ? 14 : 16,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Arial',
                    height: isSmallScreen ? 20/14 : 24/16,
                  ),
                ),
                const SizedBox(height: 7),
                // Location
                Row(
                  children: [
                    Container(
                      width: 14,
                      height: 14,
                      child: CustomPaint(
                        painter: LocationIconPainter(),
                      ),
                    ),
                    const SizedBox(width: 7),
                    const Text(
                      'OMR (IT Corridor), Chennai',
                      style: TextStyle(
                        color: Color(0xFF4A5565),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Arial',
                        height: 17.5/12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 7),
                // Price
                const Text(
                  '₹1.2 Crores',
                  style: TextStyle(
                    color: Color(0xFF155DFC),
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Arial',
                    height: 21/14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LocationIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF4A5565)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.16667
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    // Outer location shape
    final outerPath = Path();
    outerPath.addOval(Rect.fromCenter(
      center: Offset(size.width * 0.5, size.height * 0.44),
      width: size.width * 0.67,
      height: size.height * 0.67,
    ));
    canvas.drawPath(outerPath, paint);

    // Inner dot
    final innerPath = Path();
    innerPath.addOval(Rect.fromCenter(
      center: Offset(size.width * 0.5, size.height * 0.44),
      width: size.width * 0.25,
      height: size.height * 0.25,
    ));
    canvas.drawPath(innerPath, paint);

    // Location pin bottom
    final pinPath = Path();
    pinPath.moveTo(size.width * 0.5, size.height * 0.77);
    pinPath.lineTo(size.width * 0.4, size.height * 0.65);
    pinPath.lineTo(size.width * 0.6, size.height * 0.65);
    pinPath.close();
    canvas.drawPath(pinPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
