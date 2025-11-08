import 'package:buildglory/final/login/model/sendotp_response_model.dart';
import 'package:buildglory/final/login/model/user_lookup_response_model.dart';
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

class ResendOtpSuccessState extends LoginState {
  final SendOtpResponseModel resendOtpResponseModel;

  ResendOtpSuccessState({required this.resendOtpResponseModel});
}

class VerifyApiOtpSuccessState extends LoginState {
  final VerifyOtpResponseModel verifyOtpResponseModel;

  VerifyApiOtpSuccessState({required this.verifyOtpResponseModel});
}

class UserLookupSuccessState extends LoginState {
  final UserLookupResponseModel userLookupResponseModel;

  UserLookupSuccessState({required this.userLookupResponseModel});
}

class DeleteUserSuccessState extends LoginState {
  final UserLookupResponseModel userLookupResponseModel;

  DeleteUserSuccessState({required this.userLookupResponseModel});
}

class SharedPreferenceSavedState extends LoginState {
  final String token;

  SharedPreferenceSavedState({required this.token});
}
