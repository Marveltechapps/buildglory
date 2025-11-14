import 'package:buildglory/constant/constant.dart';
import 'package:buildglory/generated/bloc/bloc_exports.dart';
import 'package:buildglory/final/home/pages/home_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'custom_input_field.dart';
import 'custom_button.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // Load user profile data
    _loadUserProfile();
  }

  void _loadUserProfile() {
    final authState = context.read<AuthBloc>().state;
    if (authState is Authenticated) {
      final user = authState.user;
      _fullNameController.text = user.name ?? '';
      _emailController.text = user.email ?? '';
    } else {
      // Load profile from backend
      context.read<AuthBloc>().add(const LoadUserProfileEvent());
    }
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _saveProfile() async {
    // Validate name
    if (_fullNameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your name'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Validate email if provided
    final email = _emailController.text.trim();
    if (email.isNotEmpty && !_isValidEmail(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid email address'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() => _isLoading = true);

    // Update profile using AuthBloc
    context.read<AuthBloc>().add(
          UpdateProfileEvent(
            name: _fullNameController.text.trim(),
            email: email.isNotEmpty ? email : null,
          ),
        );
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
        if (state is ProfileUpdated) {
          setState(() => _isLoading = false);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Profile updated successfully!'),
              backgroundColor: Colors.green,
            ),
          );
          // Navigate to home
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeMainScreen(),
            ),
          );
        } else if (state is AuthError) {
          setState(() => _isLoading = false);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        } else if (state is Authenticated) {
          // Profile loaded, update fields
          final user = state.user;
          if (_fullNameController.text.isEmpty) {
            _fullNameController.text = user.name ?? '';
            _emailController.text = user.email ?? '';
          }
        }
      }, builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xFFF9FAFB),
          appBar: AppBar(
            backgroundColor: const Color(0xFFF9FAFB),
            title: const Text(
              'Profile Setup',
              style: TextStyle(
                color: Color(0xFF1A1A1A),
                fontSize: 18,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.35,
                fontFamily: 'Arial',
                height: 1,
              ),
            ),
          ),
          body: SafeArea(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 480),
              width: double.infinity,
              child: Column(
                children: [
                  // Content Section
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          // Skip Button
                          Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return HomeMainScreen();
                                    },
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                    color: const Color(0xFFCCCCCC),
                                    width: 1,
                                  ),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 4,
                                ),
                                child: const Text(
                                  'Skip',
                                  style: TextStyle(
                                    color: Color(0xFF5C5C5C),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    height: 2,
                                    fontFamily: 'Arial',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          // Profile Picture Section
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  maxRadius: 30,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SvgPicture.asset(
                                      profilegreyIcon,
                                      width: 84,
                                      height: 98,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const SizedBox(
                                  width: 335,
                                  height: 18,
                                  child: Text(
                                    'Upload profile picture',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF4A5565),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      height: 1,
                                      fontFamily: 'Arial',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          // Form Fields
                          Column(
                            children: [
                              CustomInputField(
                                label: 'Full Name*',
                                placeholder: 'Enter your full name',
                                controller: _fullNameController,
                              ),
                              const SizedBox(height: 20),
                              CustomInputField(
                                label: 'Email address (optional)',
                                placeholder: 'Enter your email address',
                                controller: _emailController,
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          // Save Button
                          CustomButton(
                            text: _isLoading ? 'Saving...' : 'Save',
                            onPressed: _isLoading ? () {} : _saveProfile,
                          ),

                          // Loading Indicator
                          if (_isLoading)
                            const Padding(
                              padding: EdgeInsets.only(top: 16),
                              child: CircularProgressIndicator(),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
