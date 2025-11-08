import 'package:flutter/material.dart';
import '../widgets/property_card.dart';
import '../widgets/custom_search_field.dart';

class CommercialListPage extends StatelessWidget {
  const CommercialListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 640;
    final isDesktop = screenWidth > 991;

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          constraints: BoxConstraints(
            maxWidth: isDesktop ? 600 : double.infinity,
          ),
          child: Column(
            children: [
              // Header Container
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: isTablet ? 16 : (screenWidth <= 640 ? 12 : 17.5),
                  vertical: 16,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFFF3F4F6),
                      width: 1,
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    // Header Row
                    Container(
                      height: 42,
                      child: Row(
                        children: [
                          // Back Button
                          Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(33554400),
                            ),
                            child: Center(
                              child: SizedBox(
                                width: 14,
                                height: 14,
                                child: CustomPaint(
                                  painter: BackIconPainter(),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: screenWidth <= 640 ? 6 : 8),
                          // Title and Subtitle
                          Expanded(
                            child: Container(
                              height: 42,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 24.5,
                                    child: Text(
                                      'Commercial Properties',
                                      style: TextStyle(
                                        fontFamily: 'Arial',
                                        fontSize: screenWidth <= 640 ? 16 : 17.5,
                                        fontWeight: FontWeight.w700,
                                        height: screenWidth <= 640 ? 22/16 : 24.5/17.5,
                                        color: const Color(0xFF0A0A0A),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '3 spaces available',
                                    style: TextStyle(
                                      fontFamily: 'Arial',
                                      fontSize: screenWidth <= 640 ? 11 : 12,
                                      fontWeight: FontWeight.w400,
                                      height: 17.5/12,
                                      color: const Color(0xFF6A7282),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Filter Button
                          Container(
                            width: 31.5,
                            height: 31.5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.75),
                            ),
                            child: Center(
                              child: SizedBox(
                                width: 14,
                                height: 14,
                                child: CustomPaint(
                                  painter: FilterIconPainter(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),
                    // Search Field
                    const CustomSearchField(),
                  ],
                ),
              ),
              // Content Container
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(
                    isTablet ? 16 : (screenWidth <= 640 ? 12 : 20),
                  ),
                  child: const PropertyCard(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BackIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF0A0A0A)
      ..strokeWidth = 1.16667
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;

    final path = Path();
    // Arrow path
    path.moveTo(7, 11.0837);
    path.lineTo(2.91669, 7.00033);
    path.lineTo(7, 2.91699);

    canvas.drawPath(path, paint);

    // Line path
    final linePath = Path();
    linePath.moveTo(11.0834, 7);
    linePath.lineTo(2.91669, 7);

    canvas.drawPath(linePath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class FilterIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF0A0A0A)
      ..strokeWidth = 1.16667
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(6.58333, 11.6667);
    path.cubicTo(6.58328, 11.7751, 6.61343, 11.8813, 6.67041, 11.9736);
    path.cubicTo(6.72739, 12.0658, 6.80894, 12.1403, 6.90591, 12.1887);
    path.lineTo(8.07258, 12.7721);
    path.cubicTo(8.16153, 12.8165, 8.26038, 12.8375, 8.35972, 12.833);
    path.cubicTo(8.45906, 12.8285, 8.5556, 12.7987, 8.64018, 12.7464);
    path.cubicTo(8.72475, 12.6941, 8.79455, 12.621, 8.84294, 12.5341);
    path.cubicTo(8.89133, 12.4472, 8.91671, 12.3494, 8.91666, 12.25);
    path.lineTo(8.91666, 8.16667);
    path.cubicTo(8.91679, 7.87756, 9.02426, 7.59879, 9.21824, 7.38442);
    path.lineTo(13.4317, 2.72417);
    path.cubicTo(13.5072, 2.64049, 13.5568, 2.53673, 13.5746, 2.42543);
    path.cubicTo(13.5924, 2.31413, 13.5776, 2.20006, 13.5319, 2.09701);
    path.cubicTo(13.4863, 1.99396, 13.4117, 1.90635, 13.3173, 1.84476);
    path.cubicTo(13.2229, 1.78318, 13.1127, 1.75027, 13, 1.75);
    path.lineTo(2.49999, 1.75);
    path.cubicTo(2.38718, 1.75004, 2.2768, 1.78279, 2.18222, 1.84429);
    path.cubicTo(2.08764, 1.90578, 2.01293, 1.99338, 1.96712, 2.09648);
    path.cubicTo(1.92131, 2.19957, 1.90639, 2.31374, 1.92414, 2.42514);
    path.cubicTo(1.9419, 2.53655, 1.99158, 2.64042, 2.06716, 2.72417);
    path.lineTo(6.28174, 7.38442);
    path.cubicTo(6.47572, 7.59879, 6.5832, 7.87756, 6.58333, 8.16667);
    path.lineTo(6.58333, 11.6667);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
