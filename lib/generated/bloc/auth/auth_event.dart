import 'package:equatable/equatable.dart';

/// Authentication Events
abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

/// Send OTP to mobile number
class SendOTPEvent extends AuthEvent {
  final String mobileNumber;

  const SendOTPEvent(this.mobileNumber);

  @override
  List<Object?> get props => [mobileNumber];
}

/// Verify OTP and login
class VerifyOTPEvent extends AuthEvent {
  final String mobileNumber;
  final String otp;

  const VerifyOTPEvent({
    required this.mobileNumber,
    required this.otp,
  });

  @override
  List<Object?> get props => [mobileNumber, otp];
}

/// Resend OTP
class ResendOTPEvent extends AuthEvent {
  final String mobileNumber;

  const ResendOTPEvent(this.mobileNumber);

  @override
  List<Object?> get props => [mobileNumber];
}

/// Check authentication status
class CheckAuthStatusEvent extends AuthEvent {
  const CheckAuthStatusEvent();
}

/// Load user profile
class LoadUserProfileEvent extends AuthEvent {
  const LoadUserProfileEvent();
}

class SPEvent extends AuthEvent {
  final String token;

  const SPEvent({required this.token});
}

class DummyEvent extends AuthEvent {
  const DummyEvent();
}

/// Update user profile
class UpdateProfileEvent extends AuthEvent {
  final String? name;
  final String? email;
  final String? profileImage;

  const UpdateProfileEvent({
    this.name,
    this.email,
    this.profileImage,
  });

  @override
  List<Object?> get props => [name, email, profileImage];
}

/// Logout
class LogoutEvent extends AuthEvent {
  const LogoutEvent();
}

/// Clear error
class ClearAuthErrorEvent extends AuthEvent {
  const ClearAuthErrorEvent();
}

/// Upload profile image from device
class UploadProfileImageEvent extends AuthEvent {
  final String filePath;

  const UploadProfileImageEvent(this.filePath);

  @override
  List<Object?> get props => [filePath];
}
