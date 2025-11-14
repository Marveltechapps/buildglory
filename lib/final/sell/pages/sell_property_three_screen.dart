import 'dart:io';
import 'package:buildglory/final/sell/bloc/sell_property_bloc.dart';
import 'package:buildglory/final/sell/pages/sell_property_four_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class SellPropertyThreeScreen extends StatefulWidget {
  const SellPropertyThreeScreen({super.key});

  static TextEditingController descriptionController = TextEditingController();

  @override
  State<SellPropertyThreeScreen> createState() =>
      _SellPropertyThreeScreenState();
}

class _SellPropertyThreeScreenState extends State<SellPropertyThreeScreen> {
  final ImagePicker _picker = ImagePicker();
  List<File> selectedImages = [];

  void _showImageSourceBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Handle bar
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFFE5E7EB),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              // Title
              const Text(
                'Choose Photo Source',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF0A0A0A),
                  fontFamily: 'Arial',
                ),
              ),
              const SizedBox(height: 20),
              // Camera Option
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3F4F6),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.camera_alt,
                    color: Color(0xFF155DFC),
                  ),
                ),
                title: const Text(
                  'Camera',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF0A0A0A),
                    fontFamily: 'Arial',
                  ),
                ),
                subtitle: const Text(
                  'Take a photo using camera',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF6A7282),
                    fontFamily: 'Arial',
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _pickImageFromCamera();
                },
              ),
              const SizedBox(height: 10),
              // Gallery Option
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3F4F6),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.photo_library,
                    color: Color(0xFF155DFC),
                  ),
                ),
                title: const Text(
                  'Gallery',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF0A0A0A),
                    fontFamily: 'Arial',
                  ),
                ),
                subtitle: const Text(
                  'Choose from gallery',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF6A7282),
                    fontFamily: 'Arial',
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _pickImageFromGallery();
                },
              ),
              const SizedBox(height: 10),
              // Cancel Button
              SizedBox(
                width: double.infinity,
                height: 48,
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFFE5E7EB)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF0A0A0A),
                      fontFamily: 'Arial',
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _pickImageFromCamera() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 85,
        preferredCameraDevice: CameraDevice.rear,
      );
      if (image != null) {
        final imageFile = File(image.path);

        // Validate image format
        if (!_isValidImageFormat(image.path)) {
          _showErrorMessage(
              'Invalid image format. Please use JPG, JPEG or PNG');
          return;
        }

        // Validate image size
        if (!await _isValidImageSize(imageFile)) {
          return;
        }

        setState(() {
          selectedImages.add(imageFile);
        });
        _showSuccessMessage('Photo captured successfully');
      }
    } catch (e) {
      _showErrorMessage('Failed to capture photo: $e');
    }
  }

  Future<void> _pickImageFromGallery() async {
    try {
      final List<XFile> images = await _picker.pickMultiImage(
        imageQuality: 85,
      );
      if (images.isNotEmpty) {
        // Validate all images
        List<File> validImages = [];
        int invalidFormatCount = 0;
        int invalidSizeCount = 0;

        for (var xFile in images) {
          final imageFile = File(xFile.path);

          // Check format
          if (!_isValidImageFormat(xFile.path)) {
            invalidFormatCount++;
            continue;
          }

          // Check size
          if (!await _isValidImageSize(imageFile)) {
            invalidSizeCount++;
            continue;
          }

          validImages.add(imageFile);
        }

        if (validImages.isNotEmpty) {
          setState(() {
            selectedImages.addAll(validImages);
          });

          String message = '${validImages.length} photo(s) selected';
          if (invalidFormatCount > 0 || invalidSizeCount > 0) {
            message += '\n';
            if (invalidFormatCount > 0) {
              message += '$invalidFormatCount invalid format(s) skipped. ';
            }
            if (invalidSizeCount > 0) {
              message += '$invalidSizeCount too large (max 10MB). ';
            }
            _showErrorMessage(message);
          } else {
            _showSuccessMessage(message);
          }
        } else {
          if (invalidFormatCount > 0) {
            _showErrorMessage('No valid images. Only JPG, JPEG, PNG allowed.');
          } else if (invalidSizeCount > 0) {
            _showErrorMessage(
                'All images too large. Maximum size is 10 MB per image.');
          }
        }
      }
    } catch (e) {
      _showErrorMessage('Failed to select photos: $e');
    }
  }

  bool _isValidImageFormat(String path) {
    final extension = path.toLowerCase().split('.').last;
    return extension == 'jpg' || extension == 'jpeg' || extension == 'png';
  }

  Future<bool> _isValidImageSize(File file) async {
    try {
      final fileSize = await file.length();
      const maxSizeInBytes = 2 * 1024 * 1024; // 10 MB

      if (fileSize > maxSizeInBytes) {
        _showErrorMessage('Image too large. Maximum size is 2 MB');
        return false;
      }
      return true;
    } catch (e) {
      debugPrint("Error checking file size: $e");
      return true; // Allow if size check fails
    }
  }

  void _removeImage(int index) {
    setState(() {
      selectedImages.removeAt(index);
    });
    _showSuccessMessage('Photo removed');
  }

  void _showSuccessMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _navigateToNextScreen(SellPropertyBloc bloc) {
    // Save description and images to bloc
    bloc.propertyDescription =
        SellPropertyThreeScreen.descriptionController.text;
    bloc.selectedImages = selectedImages;

    debugPrint("✅ Screen 3 validation passed");
    debugPrint(
        "Description: ${SellPropertyThreeScreen.descriptionController.text}");
    debugPrint("Selected Images: ${selectedImages.length}");

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return BlocProvider.value(
            value: bloc,
            child: SellPropertyFourScreen(),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: Column(
          children: [
            // Header Container
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(color: Color(0xFFF3F4F6), width: 1),
                ),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Header Row
                  SizedBox(
                    height: 42,
                    child: Row(
                      children: [
                        // Back Button
                        Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17.5),
                          ),
                          child: IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                        const SizedBox(width: 14),
                        // Header Content
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Title
                              const SizedBox(
                                height: 25,
                                child: Text(
                                  'Property Details',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF0A0A0A),
                                    height: 1.4,
                                    fontFamily: 'Arial',
                                  ),
                                ),
                              ),
                              // Subtitle
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 1,
                                ),
                                child: const Text(
                                  'Step 3 of 4',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF4A5565),
                                    height: 1.0,
                                    fontFamily: 'Arial',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Progress Bar
                  Container(
                    height: 7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3.5),
                      color: const Color(0xFFE5E7EB),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 75,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3.5),
                              color: const Color(0xFF155DFC),
                            ),
                          ),
                        ),
                        const Expanded(flex: 25, child: SizedBox()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Form Container
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // Form Content
                    Container(
                      //    width: 342,
                      constraints: const BoxConstraints(
                        maxWidth: double.infinity,
                      ),
                      child: Column(
                        children: [
                          // Property Description Card
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              color: Colors.white,
                              border: Border.all(
                                color: const Color(0x1A000000),
                                width: 1,
                              ),
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              //   constraints: const BoxConstraints(maxWidth: 340),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Section Header
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 1,
                                    ),
                                    child: const Text(
                                      'Property Description *',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF0A0A0A),
                                        fontFamily: 'Arial',
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  // Textarea
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: const Color(0xFFF3F3F5),
                                      border: Border.all(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                    ),
                                    padding: const EdgeInsets.fromLTRB(
                                      10,
                                      7,
                                      11,
                                      14,
                                    ),
                                    child: TextFormField(
                                      controller: SellPropertyThreeScreen
                                          .descriptionController,
                                      maxLines: 3,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText:
                                            'Describe your property - location advantages, nearby facilities, unique features, etc.',
                                        hintStyle: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFF717182),
                                          height: 1.5,
                                          fontFamily: 'Arial',
                                        ),
                                        contentPadding: EdgeInsets.zero,
                                      ),
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFF0A0A0A),
                                        height: 1.5,
                                        fontFamily: 'Arial',
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  // Description Note
                                  const Text(
                                    'A detailed description helps attract more buyers',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF6A7282),
                                      height: 1.0,
                                      fontFamily: 'Arial',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Property Photos Card
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              color: Colors.white,
                              border: Border.all(
                                color: const Color(0x1A000000),
                                width: 1,
                              ),
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              // constraints: const BoxConstraints(maxWidth: 340),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Section Header
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 1,
                                    ),
                                    child: const Text(
                                      'Property Photos',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF0A0A0A),
                                        fontFamily: 'Arial',
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  // Upload Section
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(9),
                                      border: Border.all(
                                        color: const Color(0xFFD1D5DC),
                                        width: 2,
                                      ),
                                    ),
                                    padding: const EdgeInsets.fromLTRB(
                                      34,
                                      30,
                                      34,
                                      30,
                                    ),
                                    child: Column(
                                      children: [
                                        // Upload Icon
                                        Icon(Icons.camera_alt_outlined),
                                        const SizedBox(height: 13),
                                        // Upload Title
                                        const Text(
                                          'Upload Property Photos',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF0A0A0A),
                                            fontFamily: 'Arial',
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(height: 6),
                                        // Instruction Text
                                        const Text(
                                          'Add high-quality photos to showcase your property',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF4A5565),
                                            height: 1.5,
                                            fontFamily: 'Arial',
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(height: 16),
                                        // Choose Photos Button
                                        InkWell(
                                          onTap: () {
                                            _showImageSourceBottomSheet(
                                                context);
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                7,
                                              ),
                                              color: Colors.white,
                                              border: Border.all(
                                                color: const Color(0x1A000000),
                                                width: 1,
                                              ),
                                            ),
                                            padding: const EdgeInsets.fromLTRB(
                                              9,
                                              5,
                                              9,
                                              5,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(Icons.camera_alt_outlined),
                                                const SizedBox(width: 13),
                                                const Text(
                                                  'Choose Photos',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xFF0A0A0A),
                                                    height: 1.0,
                                                    fontFamily: 'Arial',
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  // Selected Images Preview
                                  if (selectedImages.isNotEmpty) ...[
                                    Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(9),
                                        color: const Color(0xFFF9FAFB),
                                        border: Border.all(
                                          color: const Color(0xFFE5E7EB),
                                          width: 1,
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${selectedImages.length} Photo${selectedImages.length > 1 ? 's' : ''} Selected',
                                            style: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xFF0A0A0A),
                                              fontFamily: 'Arial',
                                            ),
                                          ),
                                          const SizedBox(height: 12),
                                          Wrap(
                                            spacing: 8,
                                            runSpacing: 8,
                                            children: selectedImages
                                                .asMap()
                                                .entries
                                                .map((entry) {
                                              int index = entry.key;
                                              File image = entry.value;
                                              return Stack(
                                                children: [
                                                  Container(
                                                    width: 80,
                                                    height: 80,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      border: Border.all(
                                                        color: const Color(
                                                            0xFFE5E7EB),
                                                        width: 1,
                                                      ),
                                                      image: DecorationImage(
                                                        image: FileImage(image),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    top: -8,
                                                    right: -8,
                                                    child: IconButton(
                                                      icon: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(4),
                                                        decoration:
                                                            const BoxDecoration(
                                                          color: Colors.red,
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: const Icon(
                                                          Icons.close,
                                                          color: Colors.white,
                                                          size: 16,
                                                        ),
                                                      ),
                                                      onPressed: () =>
                                                          _removeImage(index),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            }).toList(),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                  ],
                                  // Note
                                  const Text(
                                    'You can add photos later if needed',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF6A7282),
                                      height: 1.0,
                                      fontFamily: 'Arial',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 18),
                    // Footer Container
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          top: BorderSide(color: Color(0x1A000000), width: 1),
                        ),
                      ),
                      padding: const EdgeInsets.fromLTRB(18, 19, 17, 0),
                      child: SizedBox(
                        height: 42,
                        child: Row(
                          children: [
                            // Previous Button
                            Expanded(
                              child: InkWell(
                                onTap: () => Navigator.pop(context),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: Colors.white,
                                    border: Border.all(
                                      color: const Color(0x1A000000),
                                      width: 1,
                                    ),
                                  ),
                                  padding: const EdgeInsets.fromLTRB(
                                    14,
                                    12,
                                    14,
                                    12,
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Previous',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF0A0A0A),
                                        height: 1.0,
                                        fontFamily: 'Arial',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 11),
                            // Continue Button
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  final bloc = context.read<SellPropertyBloc>();

                                  // Validation (optional but recommended)
                                  final description = SellPropertyThreeScreen
                                      .descriptionController.text
                                      .trim();

                                  if (description.isEmpty) {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title:
                                            const Text('Property Description'),
                                        content: const Text(
                                          'Adding a detailed description helps attract more buyers. Are you sure you want to continue without a description?',
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child:
                                                const Text('Add Description'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                              _navigateToNextScreen(bloc);
                                            },
                                            child:
                                                const Text('Continue Anyway'),
                                          ),
                                        ],
                                      ),
                                    );
                                    return;
                                  }

                                  if (description.length < 20) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'Please add a more detailed description (minimum 20 characters)'),
                                        backgroundColor: Colors.orange,
                                      ),
                                    );
                                    return;
                                  }

                                  // Proceed to next screen
                                  _navigateToNextScreen(bloc);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: const Color(0xFF155DFC),
                                  ),
                                  padding: const EdgeInsets.fromLTRB(
                                    14,
                                    12,
                                    14,
                                    12,
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Continue',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                        height: 1.0,
                                        fontFamily: 'Arial',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
