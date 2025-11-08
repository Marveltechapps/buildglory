import 'package:equatable/equatable.dart';
import '../../models/user.dart';

/// Authentication State
abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

/// Initial state
class AuthInitial extends AuthState {
  const AuthInitial();
}

/// Loading state
class AuthLoading extends AuthState {
  const AuthLoading();
}

/// Authenticated state
class Authenticated extends AuthState {
  final User user;
  final String? message;

  const Authenticated({
    required this.user,
    this.message,
  });

  @override
  List<Object?> get props => [user, message];
}

/// Unauthenticated state
class Unauthenticated extends AuthState {
  const Unauthenticated();
}

/// OTP sent state
class OTPSent extends AuthState {
  final String mobileNumber;

  const OTPSent(this.mobileNumber);

  @override
  List<Object?> get props => [mobileNumber];
}

/// OTP resent state
class OTPResent extends AuthState {
  final String mobileNumber;

  const OTPResent(this.mobileNumber);

  @override
  List<Object?> get props => [mobileNumber];
}

/// Profile updated state
class ProfileUpdated extends AuthState {
  final User user;

  const ProfileUpdated(this.user);

  @override
  List<Object?> get props => [user];
}

/// Auth error state
class AuthError extends AuthState {
  final String message;
  final bool canRetry;

  const AuthError({
    required this.message,
    this.canRetry = true,
  });

  @override
  List<Object?> get props => [message, canRetry];
}

