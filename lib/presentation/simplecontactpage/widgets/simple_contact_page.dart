import 'package:buildglory/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'contact_form_field.dart';
import 'property_card.dart';
import 'gradient_button.dart';

class SimpleContactPage extends StatefulWidget {
  const SimpleContactPage({Key? key}) : super(key: key);

  @override
  State<SimpleContactPage> createState() => _SimpleContactPageState();
}

class _SimpleContactPageState extends State<SimpleContactPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth <= 640;

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: isSmallScreen ? double.infinity : 377,
            constraints: BoxConstraints(
              maxWidth: isSmallScreen ? double.infinity : 600,
            ),
            margin: isSmallScreen
                ? EdgeInsets.zero
                : const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Section
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: isSmallScreen ? 12 : 16,
                    vertical: isSmallScreen ? 16 : 20,
                  ),
                  decoration: BoxDecoration(
                    color: blueColor,
                    // gradient: LinearGradient(
                    //   begin: Alignment.centerLeft,
                    //   end: Alignment.centerRight,
                    //   colors: [Color(0xFF9810FA), Color(0xFFE60076)],
                    // ),
                  ),
                  child: Column(
                    children: [
                      // Header with back button and title
                      SizedBox(
                        height: 35,
                        child: Row(
                          children: [
                            // Back Button
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(33554400),
                                  color: Colors.white.withOpacity(0.2),
                                ),
                                child: const Icon(
                                  Icons.arrow_back_ios_new,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10.5),
                            // Crown Icon and Title
                            Expanded(
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 21,
                                    height: 21,
                                    child: SvgPicture.asset(homewhiteIcon),
                                  ),
                                  const SizedBox(width: 7),
                                  Expanded(
                                    child: Text(
                                      'Contact Us - Luxury Villa',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: isSmallScreen ? 16 : 17.5,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Arial',
                                        height: isSmallScreen
                                            ? 22 / 16
                                            : 24.5 / 17.5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 21),
                      // Property Card
                      const PropertyCard(),
                    ],
                  ),
                ),
                // Form Section
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: isSmallScreen ? 12 : 16,
                    vertical: isSmallScreen ? 16 : 20,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Full Name Field
                        ContactFormField(
                          label: 'Full Name',
                          isRequired: true,
                          controller: _nameController,
                          hintText: 'fda',
                          icon: Icons.person_outline,
                        ),
                        const SizedBox(height: 16),
                        // Email Field
                        ContactFormField(
                          label: 'Email Address',
                          isRequired: true,
                          controller: _emailController,
                          hintText: 'your.email@example.com',
                          icon: Icons.email_outlined,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 16),
                        // Phone Field
                        ContactFormField(
                          label: 'Phone Number',
                          isRequired: true,
                          controller: _phoneController,
                          hintText: 'er4d',
                          icon: Icons.phone_outlined,
                          keyboardType: TextInputType.phone,
                        ),
                        const SizedBox(height: 16),
                        // Message Field
                        ContactFormField(
                          label: 'Message (Optional)',
                          isRequired: false,
                          controller: _messageController,
                          hintText: 'Tell us more about your requir ements...',
                          icon: Icons.chat_bubble_outline,
                          maxLines: 5,
                          height: 120,
                        ),
                        const SizedBox(height: 16),
                        // Info Card
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(
                            left: 14,
                            top: 14,
                            right: 14,
                            bottom: 16,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.75),
                            border: Border.all(color: const Color(0xFFDBEAFE)),
                            color: const Color(0xFFEFF6FF),
                          ),
                          child: Text(
                            'Our team will contact you within 2 hours during business hours (9 AM - 7 PM)',
                            style: TextStyle(
                              color: const Color(0xFF193CB8),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Arial',
                              height: 17.5 / 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Submit Button Section
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(
                    left: isSmallScreen ? 12 : 17.5,
                    right: isSmallScreen ? 12 : 17.5,
                    top: isSmallScreen ? 16 : 18.5,
                    bottom: isSmallScreen ? 16 : 0,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      top: BorderSide(color: Color(0xFFF3F4F6), width: 1),
                    ),
                  ),
                  child: GradientButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Handle form submission
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Inquiry submitted successfully!'),
                          ),
                        );
                      }
                    },
                    text: 'Submit Inqu iry',
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

class CrownIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.75
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final path = Path();

    // Crown main shape
    path.moveTo(10.6168 * size.width / 22, 2.85735 * size.height / 21);
    path.lineTo(13.9663 * size.width / 22, 7.76085 * size.height / 21);
    path.lineTo(19.0351 * size.width / 22, 4.8121 * size.height / 21);
    path.lineTo(17.2536 * size.width / 22, 14.2315 * size.height / 21);
    path.lineTo(4.74638 * size.width / 22, 14.2315 * size.height / 21);
    path.lineTo(2.2675 * size.width / 22, 5.2671 * size.height / 21);
    path.lineTo(6.70725 * size.width / 22, 8.01897 * size.height / 21);
    path.lineTo(10.6168 * size.width / 22, 2.85735 * size.height / 21);
    path.close();

    canvas.drawPath(path, paint);

    // Crown base line
    final basePath = Path();
    basePath.moveTo(4.875 * size.width / 22, 18.375 * size.height / 21);
    basePath.lineTo(17.125 * size.width / 22, 18.375 * size.height / 21);
    canvas.drawPath(basePath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
