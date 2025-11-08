import 'package:buildglory/final/login/bloc/login_bloc.dart';
import 'package:buildglory/final/login/bloc/login_event.dart';
import 'package:buildglory/final/login/bloc/login_state.dart';
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
      child: BlocProvider(
        create: (context) => LoginBloc(),
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is SendApiOtpSuccessState) {
              if (state.sendOtpResponseModel.message ==
                  "OTP sent successfully") {
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
                // Fluttertoast.showToast(
                //   msg: state.sendOtpResponseModel.message ?? "Success",
                //   toastLength: Toast.LENGTH_SHORT,
                //   timeInSecForIosWeb: 1,
                //   backgroundColor: Colors.black,
                //   textColor: Colors.white,
                //   fontSize: 16.0,
                // );
              } else {
                // ToastWidget.show(state.sendOtpResponseModel.message ?? "Error");
              }
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
                      title: "Send OTP",
                      ontap: () {
                        context.read<LoginBloc>().add(
                          SendOtpApiEvent(
                            mobilenumber: mobilenumberController.text,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
