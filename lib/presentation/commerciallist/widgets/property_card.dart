import 'package:flutter/material.dart';
import 'amenity_card.dart';

class PropertyCard extends StatelessWidget {
  const PropertyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 991;
    final isMobile = screenWidth <= 640;

    return Container(
      height: 526,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.75),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            offset: const Offset(0, 4),
            blurRadius: 6,
            spreadRadius: -1,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            offset: const Offset(0, 2),
            blurRadius: 4,
            spreadRadius: -2,
          ),
        ],
      ),
      child: Column(
        children: [
          // Image Section
          Container(
            height: 224,
            width: double.infinity,
            child: Stack(
              children: [
                // Property Image
                Container(
                  width: double.infinity,
                  height: 224,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12.75),
                      topRight: Radius.circular(12.75),
                    ),
                    image: const DecorationImage(
                      image: NetworkImage('https://api.builder.io/api/v1/image/assets/TEMP/399b65c6bf6dc2c67dd18e9804f6e4f3823b18f4?width=740'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // For Sale Badge
                Positioned(
                  left: 14,
                  top: 14,
                  child: Container(
                    width: 66,
                    height: 28,
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(33554400),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF155DFC), Color(0xFF4F39F6)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'For Sale',
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 10.5,
                          fontWeight: FontWeight.w400,
                          height: 14/10.5,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                // Heart Button
                Positioned(
                  right: 14,
                  top: 14,
                  child: Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.90),
                      borderRadius: BorderRadius.circular(33554400),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.10),
                          offset: const Offset(0, 10),
                          blurRadius: 15,
                          spreadRadius: -3,
                        ),
                        BoxShadow(
                          color: Colors.black.withOpacity(0.10),
                          offset: const Offset(0, 4),
                          blurRadius: 6,
                          spreadRadius: -4,
                        ),
                      ],
                    ),
                    child: Center(
                      child: SizedBox(
                        width: 14,
                        height: 14,
                        child: CustomPaint(
                          painter: HeartIconPainter(),
                        ),
                      ),
                    ),
                  ),
                ),
                // Commercial Badge
                Positioned(
                  left: 14,
                  bottom: 14,
                  child: Container(
                    width: 105,
                    height: 25,
                    padding: const EdgeInsets.symmetric(horizontal: 10.5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(33554400),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF2B7FFF), Color(0xFF615FFF)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 14,
                          height: 14,
                          child: CustomPaint(
                            painter: CommercialIconPainter(),
                          ),
                        ),
                        const SizedBox(width: 3.5),
                        const Expanded(
                          child: Text(
                            'Commercial',
                            style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              height: 17.5/12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Content Section
          Expanded(
            child: Container(
              padding: EdgeInsets.all(isMobile ? 12 : 16),
              child: Column(
                children: [
                  // Price and Title Section
                  Container(
                    height: isMobile ? null : 56,
                    child: isMobile
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildPriceAndTitle(),
                            const SizedBox(height: 8),
                            _buildCommercialBadge(),
                          ],
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: _buildPriceAndTitle()),
                            _buildCommercialBadge(),
                          ],
                        ),
                  ),
                  SizedBox(height: isMobile ? 12 : 16),
                  // Location Section
                  Container(
                    height: 17.5,
                    child: Row(
                      children: [
                        SizedBox(
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
                            fontFamily: 'Arial',
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            height: 17.5/12,
                            color: Color(0xFF6A7282),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: isMobile ? 12 : 16),
                  // Amenities Grid
                  Container(
                    height: isMobile ? 120 : 74,
                    child: GridView.count(
                      crossAxisCount: isMobile ? 2 : 4,
                      crossAxisSpacing: isMobile ? 8 : 14,
                      mainAxisSpacing: isMobile ? 8 : 14,
                      childAspectRatio: isMobile ? 1.1 : 0.9,
                      physics: const NeverScrollableScrollPhysics(),
                      children: const [
                        AmenityCard(
                          icon: AmenityIcon.building,
                          value: '5,200',
                          label: 'Sq ft',
                        ),
                        AmenityCard(
                          icon: AmenityIcon.capacity,
                          value: '52',
                          label: 'Capacity',
                        ),
                        AmenityCard(
                          icon: AmenityIcon.parking,
                          value: '34',
                          label: 'Parking',
                        ),
                        AmenityCard(
                          icon: AmenityIcon.star,
                          value: '2021',
                          label: 'Built',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: isMobile ? 12 : 16),
                  // Footer Section
                  Container(
                    height: 43,
                    padding: const EdgeInsets.only(top: 15),
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Color(0xFFF3F4F6),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Text(
                          'By',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 10.5,
                            fontWeight: FontWeight.w400,
                            height: 14/10.5,
                            color: Color(0xFF6A7282),
                          ),
                        ),
                        const Spacer(),
                        Container(
                          width: isMobile ? null : 105,
                          height: 28,
                          padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 7),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(33554400),
                            gradient: const LinearGradient(
                              colors: [Color(0xFF155DFC), Color(0xFF4F39F6)],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'View Space',
                              style: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                height: 17.5/12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceAndTitle() {
    return Container(
      width: 162,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 28,
            child: const Text(
              '₹3.2 Crores',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 21,
                fontWeight: FontWeight.w700,
                height: 28/21,
                color: Color(0xFF0A0A0A),
              ),
            ),
          ),
          const SizedBox(height: 7),
          const Text(
            'Tech Park Office Complex',
            style: TextStyle(
              fontFamily: 'Arial',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 21/14,
              color: Color(0xFF364153),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommercialBadge() {
    return Container(
      width: 73,
      height: 19.5,
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 1.75),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF6FF),
        borderRadius: BorderRadius.circular(6.75),
        border: Border.all(
          color: const Color(0xFFBEDBFF),
          width: 1,
        ),
      ),
      child: const Center(
        child: Text(
          'Commercial',
          style: TextStyle(
            fontFamily: 'Arial',
            fontSize: 10.5,
            fontWeight: FontWeight.w400,
            height: 14/10.5,
            color: Color(0xFF155DFC),
          ),
        ),
      ),
    );
  }
}

class HeartIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF4A5565)
      ..strokeWidth = 1.16667
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(1.16666, 6.04198);
    path.cubicTo(1.16667, 5.39284, 1.36359, 4.75898, 1.7314, 4.22411);
    path.cubicTo(2.09922, 3.68924, 2.62062, 3.27853, 3.22676, 3.04621);
    path.cubicTo(3.8329, 2.81389, 4.49525, 2.7709, 5.12633, 2.92292);
    path.cubicTo(5.75741, 3.07493, 6.32754, 3.41481, 6.76141, 3.89764);
    path.cubicTo(6.79196, 3.93032, 6.82891, 3.95637, 6.86995, 3.97418);
    path.cubicTo(6.91099, 3.99198, 6.95525, 4.00117, 6.99999, 4.00117);
    path.cubicTo(7.04473, 4.00117, 7.08899, 3.99198, 7.13003, 3.97418);
    path.cubicTo(7.17107, 3.95637, 7.20801, 3.93032, 7.23857, 3.89764);
    path.cubicTo(7.67108, 3.41167, 8.24134, 3.06894, 8.87344, 2.91508);
    path.cubicTo(9.50555, 2.76121, 10.1695, 2.80351, 10.777, 3.03634);
    path.cubicTo(11.3845, 3.26917, 11.9066, 3.68149, 12.274, 4.21842);
    path.cubicTo(12.6413, 4.75535, 12.8364, 5.39142, 12.8333, 6.04198);
    path.cubicTo(12.8333, 7.37781, 11.9583, 8.37531, 11.0833, 9.25031);
    path.lineTo(7.87966, 12.3496);
    path.cubicTo(7.77096, 12.4744, 7.63695, 12.5747, 7.48652, 12.6437);
    path.cubicTo(7.33609, 12.7128, 7.17268, 12.7491, 7.00716, 12.7501);
    path.cubicTo(6.84164, 12.7512, 6.67778, 12.717, 6.52649, 12.6498);
    path.cubicTo(6.3752, 12.5827, 6.23992, 12.4841, 6.12966, 12.3606);
    path.lineTo(2.91666, 9.25031);
    path.cubicTo(2.04166, 8.37531, 1.16666, 7.38364, 1.16666, 6.04198);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class CommercialIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 1.16667
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;

    // Building outline
    final path1 = Path();
    path1.moveTo(9.83335, 12.417);
    path1.lineTo(9.83335, 3.08366);
    path1.cubicTo(9.83335, 2.77424, 9.71044, 2.47749, 9.49164, 2.2587);
    path1.cubicTo(9.27285, 2.03991, 8.97611, 1.91699, 8.66669, 1.91699);
    path1.lineTo(6.33335, 1.91699);
    path1.cubicTo(6.02393, 1.91699, 5.72719, 2.03991, 5.5084, 2.2587);
    path1.cubicTo(5.2896, 2.47749, 5.16669, 2.77424, 5.16669, 3.08366);
    path1.lineTo(5.16669, 12.417);

    canvas.drawPath(path1, paint);

    // Base rectangle
    final path2 = Path();
    path2.moveTo(12.1667, 4.25);
    path2.lineTo(2.83335, 4.25);
    path2.cubicTo(2.18902, 4.25, 1.66669, 4.77233, 1.66669, 5.41667);
    path2.lineTo(1.66669, 11.25);
    path2.cubicTo(1.66669, 11.8943, 2.18902, 12.4167, 2.83335, 12.4167);
    path2.lineTo(12.1667, 12.4167);
    path2.cubicTo(12.811, 12.4167, 13.3334, 11.8943, 13.3334, 11.25);
    path2.lineTo(13.3334, 5.41667);
    path2.cubicTo(13.3334, 4.77233, 12.811, 4.25, 12.1667, 4.25);
    path2.close();

    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class LocationIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF6A7282)
      ..strokeWidth = 1.16667
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.stroke;

    // Location pin outline
    final path1 = Path();
    path1.moveTo(11.6666, 6.58366);
    path1.cubicTo(11.6666, 9.49624, 8.43556, 12.5296, 7.35056, 13.4664);
    path1.cubicTo(7.24949, 13.5424, 7.12645, 13.5835, 6.99998, 13.5835);
    path1.cubicTo(6.87351, 13.5835, 6.75047, 13.5424, 6.6494, 13.4664);
    path1.cubicTo(5.5644, 12.5296, 2.33331, 9.49624, 2.33331, 6.58366);
    path1.cubicTo(2.33331, 5.34598, 2.82498, 4.159, 3.70015, 3.28383);
    path1.cubicTo(4.57532, 2.40866, 5.7623, 1.91699, 6.99998, 1.91699);
    path1.cubicTo(8.23766, 1.91699, 9.42464, 2.40866, 10.2998, 3.28383);
    path1.cubicTo(11.175, 4.159, 11.6666, 5.34598, 11.6666, 6.58366);
    path1.close();

    canvas.drawPath(path1, paint);

    // Center dot
    final center = Offset(7, 6.583);
    final radius = 1.75;
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
