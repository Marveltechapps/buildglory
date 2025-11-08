abstract class LoginEvent {}

class SendOtpApiEvent extends LoginEvent {
  final String mobilenumber;

  SendOtpApiEvent({required this.mobilenumber});
}

class ResendOtpApiEvent extends LoginEvent {
  final String mobilenumber;

  ResendOtpApiEvent({required this.mobilenumber});
}

class VerifyOtpApiEvent extends LoginEvent {
  final String mobilenumber;
  final String otpvalue;

  VerifyOtpApiEvent({required this.mobilenumber, required this.otpvalue});
}

class LookupUserByMobileEvent extends LoginEvent {
  final String mobileNumber;

  LookupUserByMobileEvent({required this.mobileNumber});
}

class DeleteUserByMobileEvent extends LoginEvent {
  final String mobileNumber;

  DeleteUserByMobileEvent({required this.mobileNumber});
}

class SharedPreferenceEvent extends LoginEvent {
  final String token;

  SharedPreferenceEvent({required this.token});
}
