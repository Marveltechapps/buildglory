import 'package:buildglory/constant/constant.dart';
import 'package:buildglory/generated/bloc/bloc_exports.dart';
import 'package:buildglory/final/login/pages/otp_screen.dart';
import 'package:buildglory/final/widgets/submit_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static TextEditingController mobilenumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is OTPSent) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return OtpScreen(
                    phoneNumber: mobilenumberController.text,
                  );
                },
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('OTP sent successfully')),
            );
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(21.0),
                      child: Column(
                        spacing: 8,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome back",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Sign in to your account",
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Enter your mobile number",
                            style: TextStyle(fontSize: 18),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFF5F5F7),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: TextFormField(
                              controller: mobilenumberController,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                              ),
                              maxLength: 10,
                              decoration: InputDecoration(
                                counterText: "",
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 14,
                                ),
                                border: InputBorder.none,
                                hintText: 'Mobile Number',
                                hintStyle: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontSize: 18,
                                ),
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SubmitButtonWidget(
                    title: state is AuthLoading ? "Sending..." : "Send OTP",
                    ontap: state is AuthLoading
                        ? () {} // provide empty function instead of null
                        : () {
                            if (mobilenumberController.text.length == 10) {
                              context.read<AuthBloc>().add(
                                    SendOTPEvent(mobilenumberController.text),
                                  );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Please enter a valid 10-digit mobile number'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
