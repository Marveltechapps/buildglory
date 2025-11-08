import 'package:buildglory/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9FAFB),
        title: Text(
          'Setting',
          style: TextStyle(
            color: Color(0xFF1A1A1A),
            fontSize: 18,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.35,
            fontFamily: 'Arial',
            height: 1,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 480),
          width: double.infinity,
          child: Column(
            children: [
              // Main Content
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  child: Center(
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 336),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(13),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x1A000000),
                              offset: Offset(0, 1),
                              blurRadius: 3,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.fromLTRB(16, 16, 12, 16),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(
                              color: const Color(0xFFFFC9C9),
                              width: 1,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                logoutIcon,
                                width: 14,
                                height: 14,
                                fit: BoxFit.contain,
                              ),
                              const SizedBox(width: 12),
                              const Text(
                                'Log Out',
                                style: TextStyle(
                                  color: Color(0xFFE7000B),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Arial',
                                  height: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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
