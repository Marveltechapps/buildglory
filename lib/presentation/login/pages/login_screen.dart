import 'package:buildglory/otp/screens/login_screen_before_enter_otp.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _mobileController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _mobileController.text = '4536676767675';
  }

  @override
  void dispose() {
    _mobileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(0, 12, 0, 21),
          child: Column(
            children: [
              // Main Content
              Expanded(
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 9),
                  padding: const EdgeInsets.only(left: 21),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header Section
                      SizedBox(
                        width: 335,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Welcome back heading
                            SizedBox(
                              width: double.infinity,
                              child: const Text(
                                'Welcome back',
                                style: TextStyle(
                                  color: Color(0xFF101828),
                                  fontSize: 21,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Arial',
                                  height: 1,
                                ),
                              ),
                            ),
                            const SizedBox(height: 7),
                            // Subtitle
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(vertical: 1),
                              child: const Text(
                                'Sign in to your account',
                                style: TextStyle(
                                  color: Color(0xFF4A5565),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Arial',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 28),

                      // Input Section
                      SizedBox(
                        width: 335,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Label
                            SizedBox(
                              height: 18,
                              width: double.infinity,
                              child: const Row(
                                children: [
                                  Text(
                                    'Enter your mobile number',
                                    style: TextStyle(
                                      color: Color(0xFF364153),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Arial',
                                      height: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 4),
                            // Input Field
                            Container(
                              width: double.infinity,
                              height: 42,
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
                                style: const TextStyle(
                                  color: Color(0xFF717182),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Arial',
                                ),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.fromLTRB(
                                    11,
                                    14,
                                    11,
                                    14,
                                  ),
                                  isDense: true,
                                ),
                                keyboardType: TextInputType.phone,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Send OTP Button
              ElevatedButton(
                onPressed: () {
                  // Handle Send OTP action
                  debugPrint('Send OTP pressed');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreenBeforeEnterOtp();
                      },
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF155DFC),
                  foregroundColor: const Color(0xFFFFFFFF),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                  padding: const EdgeInsets.fromLTRB(70, 12, 70, 12),
                  minimumSize: const Size(double.infinity, 0),
                ),
                child: const Text(
                  'Send OTP',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Arial',
                    height: 1,
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
