import 'package:buildglory/constant/constant.dart';
import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const GradientButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth <= 640;

    return SizedBox(
      width: double.infinity,
      height: isSmallScreen ? 48 : 52,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(33554400),
          ),
        ),
        child: Ink(
          decoration: BoxDecoration(
            color: blueColor,
            borderRadius: BorderRadius.circular(33554400),
          ),
          child: Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 14,
                  height: 14,
                  child: CustomPaint(painter: SubmitIconPainter()),
                ),
                const SizedBox(width: 14),
                Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Arial',
                    height: 17.5 / 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SubmitIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.16667
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    // Paper plane body
    final planePath = Path();
    planePath.moveTo(size.width * 0.57, size.height * 0.85);
    planePath.lineTo(size.width * 0.86, size.height * 0.11);
    planePath.lineTo(size.width * 0.1, size.height * 0.34);
    planePath.lineTo(size.width * 0.43, size.height * 0.5);
    planePath.lineTo(size.width * 0.57, size.height * 0.85);
    canvas.drawPath(planePath, paint);

    // Paper plane line
    final linePath = Path();
    linePath.moveTo(size.width * 0.86, size.height * 0.11);
    linePath.lineTo(size.width * 0.43, size.height * 0.5);
    canvas.drawPath(linePath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
