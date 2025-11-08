import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../bloc/bloc_exports.dart';

/// OTP Login Widget using BLoC
class OTPLoginBlocWidget extends StatefulWidget {
  final VoidCallback? onSuccess;

  const OTPLoginBlocWidget({
    super.key,
    this.onSuccess,
  });

  @override
  State<OTPLoginBlocWidget> createState() => _OTPLoginBlocWidgetState();
}

class _OTPLoginBlocWidgetState extends State<OTPLoginBlocWidget> {
  final _phoneController = TextEditingController();
  final _otpController = TextEditingController();
  bool _otpSent = false;

  @override
  void dispose() {
    _phoneController.dispose();
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is OTPSent) {
          setState(() => _otpSent = true);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('OTP sent successfully')),
          );
        } else if (state is OTPResent) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('OTP resent successfully')),
          );
        } else if (state is Authenticated) {
          widget.onSuccess?.call();
        } else if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          final isLoading = state is AuthLoading;

          return Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Logo or Title
                const Icon(
                  Icons.home_work,
                  size: 80,
                  color: Colors.green,
                ),
                const SizedBox(height: 32),

                Text(
                  _otpSent ? 'Verify OTP' : 'Login',
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 8),

                Text(
                  _otpSent
                      ? 'Enter the OTP sent to ${_phoneController.text}'
                      : 'Enter your mobile number to continue',
                  style: const TextStyle(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 32),

                // Mobile Number Input
                if (!_otpSent)
                  TextField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    maxLength: 10,
                    decoration: InputDecoration(
                      labelText: 'Mobile Number',
                      hintText: '9876543210',
                      prefixIcon: const Icon(Icons.phone),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      counterText: '',
                    ),
                    enabled: !isLoading,
                  ),

                // OTP Input
                if (_otpSent) ...[
                  PinCodeTextField(
                    appContext: context,
                    length: 6,
                    controller: _otpController,
                    keyboardType: TextInputType.number,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(8),
                      fieldHeight: 50,
                      fieldWidth: 45,
                      activeFillColor: Colors.white,
                      selectedFillColor: Colors.blue.shade50,
                      inactiveFillColor: Colors.grey.shade100,
                      activeColor: Colors.blue,
                      selectedColor: Colors.blue,
                      inactiveColor: Colors.grey,
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    backgroundColor: Colors.transparent,
                    enableActiveFill: true,
                    onCompleted: (_) => _verifyOTP(context),
                    enabled: !isLoading,
                  ),

                  const SizedBox(height: 16),

                  // Resend OTP
                  TextButton(
                    onPressed: isLoading
                        ? null
                        : () {
                            context.read<AuthBloc>().add(
                                  ResendOTPEvent(_phoneController.text),
                                );
                          },
                    child: const Text('Resend OTP'),
                  ),
                ],

                const SizedBox(height: 24),

                // Error Message
                if (state is AuthError) ...[
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.red.shade200),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.error_outline, color: Colors.red.shade700),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            state.message,
                            style: TextStyle(color: Colors.red.shade700),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],

                // Action Button
                ElevatedButton(
                  onPressed: isLoading
                      ? null
                      : (_otpSent
                          ? () => _verifyOTP(context)
                          : () => _sendOTP(context)),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : Text(
                          _otpSent ? 'Verify OTP' : 'Send OTP',
                          style: const TextStyle(fontSize: 16),
                        ),
                ),

                // Back Button (when OTP sent)
                if (_otpSent) ...[
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: isLoading
                        ? null
                        : () {
                            setState(() {
                              _otpSent = false;
                              _otpController.clear();
                            });
                            context.read<AuthBloc>().add(
                                  const ClearAuthErrorEvent(),
                                );
                          },
                    child: const Text('Change Mobile Number'),
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }

  void _sendOTP(BuildContext context) {
    if (_phoneController.text.length != 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid 10-digit mobile number'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    context.read<AuthBloc>().add(SendOTPEvent(_phoneController.text));
  }

  void _verifyOTP(BuildContext context) {
    if (_otpController.text.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid 6-digit OTP'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    context.read<AuthBloc>().add(
          VerifyOTPEvent(
            mobileNumber: _phoneController.text,
            otp: _otpController.text,
          ),
        );
  }
}

/// User Profile Widget using BLoC
class UserProfileBlocWidget extends StatelessWidget {
  const UserProfileBlocWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is! Authenticated) {
          return const SizedBox.shrink();
        }

        final user = state.user;

        return ListTile(
          leading: CircleAvatar(
            backgroundImage: user.profileImage != null
                ? NetworkImage(user.profileImage!)
                : null,
            child: user.profileImage == null
                ? Text(user.name?.substring(0, 1).toUpperCase() ?? 'U')
                : null,
          ),
          title: Text(user.name ?? 'User'),
          subtitle: Text(user.email ?? user.mobileNumber),
          trailing: IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              final confirmed = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Logout'),
                  content: const Text('Are you sure you want to logout?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: const Text('Logout'),
                    ),
                  ],
                ),
              );

              if (confirmed == true && context.mounted) {
                context.read<AuthBloc>().add(const LogoutEvent());
              }
            },
          ),
        );
      },
    );
  }
}

