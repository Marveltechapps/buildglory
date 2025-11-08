import 'package:buildglory/new/presentation/profile/widgets/profile_edit_page.dart';
import 'package:buildglory/presentation/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/otp_input_field.dart';

class LoginScreenBeforeEnterOtp extends StatefulWidget {
  const LoginScreenBeforeEnterOtp({super.key});

  @override
  State<LoginScreenBeforeEnterOtp> createState() =>
      _LoginScreenBeforeEnterOtpState();
}

class _LoginScreenBeforeEnterOtpState extends State<LoginScreenBeforeEnterOtp> {
  List<String> otpValues = ['1', '2', '3', '4', '5', '6'];
  int currentIndex = 0;

  void _onOtpFieldTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  void _onResendOtp() {
    // Handle resend OTP logic
    debugPrint('Resend OTP tapped');
  }

  void _onVerify() {
    // Handle verify logic
    String otp = otpValues.join();
    debugPrint('Verify tapped with OTP: $otp');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return ProfileEditPage();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFFFF),
        title: Text(
          'Verification code',
          style: TextStyle(
            color: Color(0xFF101828),
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontFamily: 'Arial',
            height: 2,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        constraints: const BoxConstraints(maxWidth: 480),
        child: Column(
          children: [
            // Main content area
            Expanded(
              child: Container(
                width: double.infinity,
                constraints: const BoxConstraints(maxWidth: 335),
                margin: const EdgeInsets.only(top: 230),
                child: Column(
                  children: [
                    // Instruction text
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 27),
                      child: const Text(
                        'Enter your OTP code sent to 4536676767675',
                        style: TextStyle(
                          color: Color(0xFF4A5565),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Arial',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    // OTP input fields
                    Container(
                      margin: const EdgeInsets.only(top: 31),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(6, (index) {
                          return Container(
                            margin: EdgeInsets.only(right: index < 5 ? 11 : 0),
                            child: OtpInputField(
                              value: otpValues[index],
                              onTap: () => _onOtpFieldTap(index),
                            ),
                          );
                        }),
                      ),
                    ),
                    SizedBox(height: 60),
                    // Resend OTP button
                    InkWell(
                      onTap: () {
                        _onResendOtp();
                      },
                      child: Text(
                        'Resend OTP',
                        style: TextStyle(
                          color: Color(0xFF155DFC),
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

            // Verify button
            Container(
              width: double.infinity,
              constraints: const BoxConstraints(maxWidth: 335),
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 21),
              child: GestureDetector(
                onTap: _onVerify,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: const Color(0xFF155DFC),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 70,
                    vertical: 12,
                  ),
                  child: const Center(
                    child: Text(
                      'Verify',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Arial',
                        height: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
