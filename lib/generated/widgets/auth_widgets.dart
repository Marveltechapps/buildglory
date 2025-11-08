import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../providers/auth_state_notifier.dart';

/// =============================================================================
/// OTP LOGIN WIDGET
/// =============================================================================

class OTPLoginWidget extends ConsumerStatefulWidget {
  final VoidCallback? onSuccess;

  const OTPLoginWidget({
    super.key,
    this.onSuccess,
  });

  @override
  ConsumerState<OTPLoginWidget> createState() => _OTPLoginWidgetState();
}

class _OTPLoginWidgetState extends ConsumerState<OTPLoginWidget> {
  final _phoneController = TextEditingController();
  final _otpController = TextEditingController();
  bool _otpSent = false;

  @override
  void dispose() {
    _phoneController.dispose();
    _otpController.dispose();
    super.dispose();
  }

  Future<void> _sendOTP() async {
    if (_phoneController.text.length != 10) {
      _showError('Please enter a valid 10-digit mobile number');
      return;
    }

    final notifier = ref.read(authStateProvider.notifier);
    final success = await notifier.sendOTP(_phoneController.text);

    if (success && mounted) {
      setState(() => _otpSent = true);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('OTP sent successfully')),
      );
    }
  }

  Future<void> _verifyOTP() async {
    if (_otpController.text.length != 6) {
      _showError('Please enter a valid 6-digit OTP');
      return;
    }

    final notifier = ref.read(authStateProvider.notifier);
    final success = await notifier.verifyOTP(
      mobileNumber: _phoneController.text,
      otp: _otpController.text,
    );

    if (success && mounted) {
      widget.onSuccess?.call();
    }
  }

  Future<void> _resendOTP() async {
    final notifier = ref.read(authStateProvider.notifier);
    final success = await notifier.resendOTP(_phoneController.text);

    if (success && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('OTP resent successfully')),
      );
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authStateProvider);

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
              enabled: !authState.isLoading,
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
              onCompleted: (_) => _verifyOTP(),
              enabled: !authState.isLoading,
            ),

            const SizedBox(height: 16),

            // Resend OTP
            TextButton(
              onPressed: authState.isLoading ? null : _resendOTP,
              child: const Text('Resend OTP'),
            ),
          ],

          const SizedBox(height: 24),

          // Error Message
          if (authState.error != null) ...[
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
                      authState.error!,
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
            onPressed: authState.isLoading
                ? null
                : (_otpSent ? _verifyOTP : _sendOTP),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: authState.isLoading
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
              onPressed: authState.isLoading
                  ? null
                  : () {
                      setState(() {
                        _otpSent = false;
                        _otpController.clear();
                      });
                      ref.read(authStateProvider.notifier).clearError();
                    },
              child: const Text('Change Mobile Number'),
            ),
          ],
        ],
      ),
    );
  }
}

/// =============================================================================
/// USER PROFILE WIDGET
/// =============================================================================

class UserProfileWidget extends ConsumerWidget {
  const UserProfileWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    if (!authState.isAuthenticated || authState.user == null) {
      return const SizedBox.shrink();
    }

    final user = authState.user!;

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
            await ref.read(authStateProvider.notifier).logout();
          }
        },
      ),
    );
  }
}

/// =============================================================================
/// AUTH GUARD WIDGET
/// =============================================================================

/// Widget that shows login screen if not authenticated
class AuthGuard extends ConsumerWidget {
  final Widget child;
  final Widget? loginScreen;

  const AuthGuard({
    super.key,
    required this.child,
    this.loginScreen,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    if (authState.isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (!authState.isAuthenticated) {
      return loginScreen ?? Scaffold(body: OTPLoginWidget());
    }

    return child;
  }
}

