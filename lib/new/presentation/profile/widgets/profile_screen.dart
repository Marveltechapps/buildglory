import 'package:buildglory/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController(
    text: '+91 9629999333',
  );
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _mobileController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9FAFB),
        title: Row(
          children: [
            Text(
              "Profile",
              style: TextStyle(
                color: Color(0xFF1A1A1A),
                fontSize: 18,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.35,
                fontFamily: 'Arial',
                height: 1,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 480),
          child: Column(
            children: [
              // Content Section
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Profile Picture Section
                      const Text(
                        'Profile picture',
                        style: TextStyle(
                          color: Color(0xFF364153),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Arial',
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF9FAFB),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: const Color(0xFFD1D5DC),
                            width: 2,
                          ),
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            // Avatar Container
                            Container(
                              width: 56,
                              height: 56,
                              decoration: BoxDecoration(
                                color: const Color(0xFFE5E7EB),
                                borderRadius: BorderRadius.circular(28),
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  camerablackIcon,
                                  width: 28,
                                  height: 28,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),

                            // Upload Button
                            Container(
                              width: 132,
                              height: 35,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFFFFF),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: const Color(0xFF155DFC),
                                  width: 1,
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  '+ Upload photo',
                                  style: TextStyle(
                                    color: Color(0xFF155DFC),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Arial',
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),

                            // Upload Instructions
                            const SizedBox(
                              width: 289,
                              child: Text(
                                'Click from Camera or browse to upload',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF6A7282),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Arial',
                                ),
                              ),
                            ),
                            const SizedBox(height: 12),

                            // File Format Info
                            const SizedBox(
                              width: 289,
                              child: Text(
                                'Upload up to max size, check in format jpeg/jpg/png file',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF99A1AF),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Arial',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Form Fields Section
                      // Full Name Field
                      const Text(
                        'Full Name ',
                        style: TextStyle(
                          color: Color(0xFF101828),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Arial',
                        ),
                      ),
                      const SizedBox(height: 7),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF3F3F5),
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(
                            color: Colors.transparent,
                            width: 1,
                          ),
                        ),
                        child: TextField(
                          controller: _fullNameController,
                          decoration: const InputDecoration(
                            hintText: 'Enter your full name',
                            hintStyle: TextStyle(
                              color: Color(0xFF71717E),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Arial',
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(12),
                          ),
                          style: const TextStyle(
                            color: Color(0xFF71717E),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Arial',
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Mobile Number Field
                      const Text(
                        'Mobile Number*',
                        style: TextStyle(
                          color: Color(0xFF101828),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Arial',
                        ),
                      ),
                      const SizedBox(height: 7),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF3F3F5),
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(
                            color: Colors.transparent,
                            width: 1,
                          ),
                        ),
                        child: TextField(
                          controller: _mobileController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(12),
                          ),
                          style: const TextStyle(
                            color: Color(0xFF71717E),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Arial',
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Email Address Field
                      const Text(
                        'Email address',
                        style: TextStyle(
                          color: Color(0xFF101828),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Arial',
                        ),
                      ),
                      const SizedBox(height: 7),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF3F3F5),
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(
                            color: Colors.transparent,
                            width: 1,
                          ),
                        ),
                        child: TextField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            hintText: 'Enter your email address',
                            hintStyle: TextStyle(
                              color: Color(0xFF71717E),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Arial',
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(12),
                          ),
                          style: const TextStyle(
                            color: Color(0xFF71717E),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Arial',
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Confirm Button
                      Container(
                        width: double.infinity,
                        height: 48,
                        decoration: BoxDecoration(
                          color: const Color(0xFF155DFC),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF155DFC),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                          ),
                          child: const Text(
                            'Confirm',
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Arial',
                              height: 2,
                            ),
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
      ),
    );
  }
}
