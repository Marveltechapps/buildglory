import 'package:buildglory/final/login/bloc/login_bloc.dart';
import 'package:buildglory/final/login/bloc/login_event.dart';
import 'package:buildglory/final/login/bloc/login_state.dart';
import 'package:buildglory/final/widgets/appbar_widget.dart';
import 'package:buildglory/final/login/pages/verification_success_screen.dart';
import 'package:buildglory/presentation/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpScreen extends StatefulWidget {
  final String phoneNumber;
  final VoidCallback? onResendOtp;

  const OtpScreen({super.key, required this.phoneNumber, this.onResendOtp});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final List<TextEditingController> _controllers = List.generate(
    4,
    (index) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _onDigitChanged(String value, int index) {
    if (value.isNotEmpty && index < 3) {
      _focusNodes[index + 1].requestFocus();
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
  }

  String get _otpCode {
    return _controllers.map((controller) => controller.text).join();
  }

  bool get _isOtpComplete {
    return _otpCode.length == 4;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is VerifyApiOtpSuccessState) {
            context.read<LoginBloc>().add(
              SharedPreferenceEvent(
                token: state.verifyOtpResponseModel.token ?? "",
              ),
            );
          } else if (state is SharedPreferenceSavedState) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return VerificationSuccessScreen();
                },
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: /* AppBar(
                  backgroundColor: Colors.white,
                  title: Text(
                    'Verification code',
                    style: TextStyle(
                      color: Color(0xFF101828),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.31,
                      fontFamily: 'Arial',
                    ),
                  ),
                ), */ PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: AppbarWidget(title: "Verification Code", subtitle: ""),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                // constraints: const BoxConstraints(maxWidth: 480),
                width: double.infinity,
                decoration: const BoxDecoration(color: Colors.white),
                child: Column(
                  children: [
                    // Main Content
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: Container(
                          constraints: const BoxConstraints(maxWidth: 367),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 20,
                          ),
                          child: Column(
                            children: [
                              // Instruction Text
                              Container(
                                width: double.infinity,
                                constraints: const BoxConstraints(
                                  maxWidth: 335,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 23,
                                  ),
                                  child: Text(
                                    'Enter your OTP code sent to ${widget.phoneNumber}',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Color(0xFF4A5565),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      height: 1.5,
                                      fontFamily: 'Arial',
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 24),

                              // OTP Input Fields
                              Container(
                                width: double.infinity,
                                constraints: const BoxConstraints(
                                  maxWidth: 335,
                                ),
                                height: 60,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(4, (index) {
                                    return Container(
                                      margin: EdgeInsets.only(
                                        right: index < 3 ? 12 : 0,
                                      ),
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          border: Border.all(
                                            color: const Color(0xFFD1D5DC),
                                            width: 1,
                                          ),
                                        ),
                                        child: TextField(
                                          controller: _controllers[index],
                                          focusNode: _focusNodes[index],
                                          cursorHeight: 20,
                                          textAlign: TextAlign.center,
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(1),
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                          ],
                                          style: const TextStyle(
                                            color: Color(0xFF1A1A1A),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            height: 2,
                                            fontFamily: 'Arial',
                                          ),
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding: EdgeInsets.zero,
                                          ),
                                          onChanged: (value) =>
                                              _onDigitChanged(value, index),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              ),

                              const SizedBox(height: 24),

                              // Resend OTP Button
                              GestureDetector(
                                onTap: widget.onResendOtp,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 9,
                                    vertical: 6,
                                  ),
                                  child: const Text(
                                    'Resend OTP',
                                    style: TextStyle(
                                      color: Color(0xFF155DFC),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Arial',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // Verify Button
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(bottom: 20),
                      child: GestureDetector(
                        onTap: () {
                          context.read<LoginBloc>().add(
                            VerifyOtpApiEvent(
                              mobilenumber: widget.phoneNumber,
                              otpvalue: _otpCode,
                            ),
                          );
                        },
                        child: Container(
                          height: 42,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xFF155DFC),
                          ),
                          child: const Center(
                            child: Text(
                              'Verify',
                              style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Arial',
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
        },
      ),
    );
  }
}
