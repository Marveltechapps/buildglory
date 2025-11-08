import 'package:buildglory/final/login/model/sendotp_response_model.dart';
import 'package:buildglory/final/login/model/verifyotp_response_model.dart';

abstract class LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginErrorState extends LoginState {
  final String errorMsg;

  LoginErrorState({required this.errorMsg});
}

class SendApiOtpSuccessState extends LoginState {
  final SendOtpResponseModel sendOtpResponseModel;

  SendApiOtpSuccessState({required this.sendOtpResponseModel});
}

class VerifyApiOtpSuccessState extends LoginState {
  final VerifyOtpResponseModel verifyOtpResponseModel;

  VerifyApiOtpSuccessState({required this.verifyOtpResponseModel});
}

class SharedPreferenceSavedState extends LoginState {
  final String token;

  SharedPreferenceSavedState({required this.token});
}
