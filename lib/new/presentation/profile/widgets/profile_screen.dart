import 'dart:io';

import 'package:buildglory/constant/constant.dart';
import 'package:buildglory/generated/bloc/auth/auth_bloc.dart';
import 'package:buildglory/generated/bloc/auth/auth_event.dart';
import 'package:buildglory/generated/bloc/auth/auth_state.dart';
import 'package:buildglory/generated/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  final RegExp _emailRegex =
      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$', caseSensitive: false);

  String _profileImageUrl = '';
  File? _localImageFile;
  bool _hasInitialized = false;

  @override
  void initState() {
    super.initState();
    final authState = context.read<AuthBloc>().state;
    if (authState is Authenticated) {
      _applyUserData(authState.user, force: true);
    } else if (authState is ProfileUpdated) {
      _applyUserData(authState.user, force: true);
    } else {
      context.read<AuthBloc>().add(const LoadUserProfileEvent());
    }
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _mobileController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9FAFB),
        title: const Text(
          "Profile",
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
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is Authenticated) {
              _localImageFile = null;
              _applyUserData(state.user);
            } else if (state is ProfileUpdated) {
              _localImageFile = null;
              _applyUserData(state.user, force: true);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Profile updated successfully'),
                  backgroundColor: Colors.green,
                ),
              );
            } else if (state is AuthError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            final isLoading = state is AuthLoading;
            return Stack(
              children: [
                _buildContent(context),
                if (isLoading)
                  Container(
                    color: Colors.black.withOpacity(0.15),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 480),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProfilePictureSection(),
                  const SizedBox(height: 24),
                  _buildFormFields(),
                  const SizedBox(height: 24),
                  _buildConfirmButton(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfilePictureSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Profile picture',
          style: TextStyle(
            color: Color(0xFF364153),
            fontSize: 12,
            fontWeight: FontWeight.w400,
            fontFamily: 'Arial',
          ),
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFFF9FAFB),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: const Color(0xFFD1D5DC),
              width: 2,
            ),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildAvatarPreview(),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildUploadButton(
                    'Camera',
                    onTap: () => _pickImage(ImageSource.camera),
                  ),
                  const SizedBox(width: 12),
                  _buildUploadButton(
                    'Gallery',
                    onTap: () => _pickImage(ImageSource.gallery),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const SizedBox(
                width: 289,
                child: Text(
                  'Click from camera or browse to upload',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF6A7282),
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Arial',
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const SizedBox(
                width: 289,
                child: Text(
                  'Upload up to max size 2MB, formats jpeg/jpg/png',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF99A1AF),
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Arial',
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAvatarPreview() {
    Widget child;
    if (_localImageFile != null) {
      child = ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: Image.file(
          _localImageFile!,
          width: 56,
          height: 56,
          fit: BoxFit.cover,
        ),
      );
    } else if (_profileImageUrl.isNotEmpty) {
      child = ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: Image.network(
          _profileImageUrl,
          width: 56,
          height: 56,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => _buildImagePlaceholder(),
        ),
      );
    } else {
      child = _buildImagePlaceholder();
    }

    return GestureDetector(
      onTap: _showImagePickerOptions,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: const Color(0xFFE5E7EB),
              borderRadius: BorderRadius.circular(36),
            ),
            child: child,
          ),
          Positioned(
            bottom: 4,
            right: 4,
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE5E7EB)),
              ),
              child: Center(
                child: SvgPicture.asset(
                  camerablackIcon,
                  width: 14,
                  height: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImagePlaceholder() {
    return Center(
      child: SvgPicture.asset(
        profileblueIcon,
        width: 32,
        height: 32,
        colorFilter: const ColorFilter.mode(
          Color(0xFF155DFC),
          BlendMode.srcIn,
        ),
      ),
    );
  }

  Widget _buildUploadButton(
    String label, {
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Color(0xFF155DFC)),
          foregroundColor: const Color(0xFF155DFC),
        ),
        child: Text(label),
      ),
    );
  }

  Widget _buildFormFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInputLabel('Full Name'),
        const SizedBox(height: 7),
        _buildTextField(
          controller: _fullNameController,
          hint: 'Enter your full name',
          textInputType: TextInputType.name,
        ),
        const SizedBox(height: 16),
        _buildInputLabel('Mobile Number*'),
        const SizedBox(height: 7),
        _buildTextField(
          controller: _mobileController,
          readOnly: true,
        ),
        const SizedBox(height: 16),
        _buildInputLabel('Email address'),
        const SizedBox(height: 7),
        _buildTextField(
          controller: _emailController,
          hint: 'Enter your email address',
          textInputType: TextInputType.emailAddress,
        ),
      ],
    );
  }

  Widget _buildInputLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xFF101828),
        fontSize: 12,
        fontWeight: FontWeight.w400,
        fontFamily: 'Arial',
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    String? hint,
    bool readOnly = false,
    TextInputType textInputType = TextInputType.text,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFF3F3F5),
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color: Colors.transparent,
          width: 1,
        ),
      ),
      child: TextField(
        controller: controller,
        readOnly: readOnly,
        keyboardType: textInputType,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
            color: Color(0xFF71717E),
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontFamily: 'Arial',
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(12),
        ),
        style: const TextStyle(
          color: Color(0xFF1A1A1A),
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontFamily: 'Arial',
        ),
      ),
    );
  }

  Widget _buildConfirmButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: _submitProfileUpdate,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF155DFC),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
          elevation: 0,
        ),
        child: const Text(
          'Confirm',
          style: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: 'Arial',
          ),
        ),
      ),
    );
  }

  void _applyUserData(User user, {bool force = false}) {
    if (!_hasInitialized || force) {
      _fullNameController.text = user.name ?? '';
      _emailController.text = user.email ?? '';
      _mobileController.text = user.mobileNumber.startsWith('+')
          ? user.mobileNumber
          : '+91 ${user.mobileNumber}';
      _hasInitialized = true;
    }
    setState(() {
      _profileImageUrl = user.profileImage ?? '';
    });
  }

  void _showImagePickerOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Upload profile picture',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                          _pickImage(ImageSource.camera);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF155DFC),
                        ),
                        icon: const Icon(Icons.camera_alt_outlined),
                        label: const Text('Camera'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                          _pickImage(ImageSource.gallery);
                        },
                        icon: const Icon(Icons.photo_library_outlined),
                        label: const Text('Gallery'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(
        source: source,
        imageQuality: 85,
      );
      if (pickedFile == null) return;

      final compressedFile =
          await _compressImageIfNeeded(File(pickedFile.path));
      if (compressedFile == null) return;

      setState(() {
        _localImageFile = compressedFile;
      });
      context
          .read<AuthBloc>()
          .add(UploadProfileImageEvent(compressedFile.path));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to pick image: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<File?> _compressImageIfNeeded(File originalFile) async {
    const int maxSizeBytes = 2 * 1024 * 1024;
    if (await originalFile.length() <= maxSizeBytes) {
      return originalFile;
    }

    try {
      final bytes = await originalFile.readAsBytes();
      final originalImage = img.decodeImage(bytes);
      if (originalImage == null) {
        _showValidationMessage('Unable to process selected image.');
        return null;
      }

      img.Image workingImage = originalImage;
      int quality = 90;
      double scale = 1.0;

      while (quality >= 40) {
        final encodedBytes = img.encodeJpg(workingImage, quality: quality);
        if (encodedBytes.length <= maxSizeBytes) {
          final tempDir = await getTemporaryDirectory();
          final compressedFile = File(
            '${tempDir.path}/profile_${DateTime.now().millisecondsSinceEpoch}.jpg',
          );
          await compressedFile.writeAsBytes(encodedBytes, flush: true);
          return compressedFile;
        }

        if (quality > 60) {
          quality -= 10;
        } else {
          scale *= 0.85;
          final newWidth = (originalImage.width * scale).round();
          final newHeight = (originalImage.height * scale).round();

          if (newWidth < 400 || newHeight < 400) {
            break;
          }

          workingImage = img.copyResize(
            originalImage,
            width: newWidth,
            height: newHeight,
          );
        }
      }

      _showValidationMessage(
        'Unable to compress image under 2MB. Try another one.',
      );
      return null;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to compress image: $e'),
          backgroundColor: Colors.red,
        ),
      );
      return null;
    }
  }

  void _submitProfileUpdate() {
    final name = _fullNameController.text.trim();
    final email = _emailController.text.trim();

    if (name.isEmpty) {
      _showValidationMessage('Please enter your full name');
      return;
    }

    if (email.isNotEmpty && !_emailRegex.hasMatch(email)) {
      _showValidationMessage('Please enter a valid email address');
      return;
    }

    context.read<AuthBloc>().add(
          UpdateProfileEvent(
            name: name,
            email: email.isEmpty ? null : email,
          ),
        );
  }

  void _showValidationMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.orange,
      ),
    );
  }
}
