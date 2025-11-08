abstract class LoginEvent {}

class SendOtpApiEvent extends LoginEvent {
  final String mobilenumber;

  SendOtpApiEvent({required this.mobilenumber});
}

class VerifyOtpApiEvent extends LoginEvent {
  final String mobilenumber;
  final String otpvalue;

  VerifyOtpApiEvent({required this.mobilenumber, required this.otpvalue});
}

class SharedPreferenceEvent extends LoginEvent {
  final String token;

  SharedPreferenceEvent({required this.token});
}
