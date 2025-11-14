import 'package:buildglory/constant/constant.dart';
import 'package:buildglory/generated/api_client_factory.dart';
import 'package:buildglory/generated/services/feedback_service.dart';
import 'package:buildglory/new/profile/help&feedback/feedback_sent_screen.dart';
import 'package:flutter/material.dart';

class SubmitFeedbackScreen extends StatefulWidget {
  const SubmitFeedbackScreen({super.key});

  @override
  State<SubmitFeedbackScreen> createState() => _SubmitFeedbackScreenState();
}

class _SubmitFeedbackScreenState extends State<SubmitFeedbackScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();
  final RegExp _emailRegex =
      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$', caseSensitive: false);

  late final FeedbackService _feedbackService;
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    final apiFactory = ApiClientFactory(baseUrl: baseUrl);
    _feedbackService = apiFactory.feedback;
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _submitFeedback() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSubmitting = true);

    final response = await _feedbackService.submitFeedback(
      fullName: _fullNameController.text.trim(),
      email: _emailController.text.trim(),
      subject: _subjectController.text.trim().isEmpty
          ? 'Feedback'
          : _subjectController.text.trim(),
      message: _messageController.text.trim(),
    );

    if (!mounted) return;

    response.when(
      success: (_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const FeedbackSentScreen(),
          ),
        );
      },
      failure: (error) {
        setState(() => _isSubmitting = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.message),
            backgroundColor: Colors.red,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9FAFB),
        title: const Text(
          'Submit Feedback',
          style: TextStyle(
            fontFamily: 'Arial',
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1A1A1A),
            letterSpacing: -0.35,
            height: 1,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 25,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Submit Feedback',
                                    style: TextStyle(
                                      color: Color(0xFF102818),
                                      fontSize: 18,
                                      letterSpacing: -0.17,
                                      height: 1.4,
                                      fontFamily: 'Arial',
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'We\'d love to hear from you',
                                style: TextStyle(
                                  color: Color(0xFF4A5565),
                                  fontSize: 12,
                                  height: 1,
                                  fontFamily: 'Arial',
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        _buildInputLabel('Full Name *'),
                        const SizedBox(height: 7),
                        _buildTextField(
                          controller: _fullNameController,
                          hint: 'Enter your full name',
                          validator: (value) =>
                              (value == null || value.trim().isEmpty)
                                  ? 'Please enter your full name'
                                  : null,
                        ),
                        const SizedBox(height: 16),
                        _buildInputLabel('Email Address *'),
                        const SizedBox(height: 7),
                        _buildTextField(
                          controller: _emailController,
                          hint: 'Enter your email address',
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter your email address';
                            }
                            if (!_emailRegex.hasMatch(value.trim())) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        _buildInputLabel('Subject'),
                        const SizedBox(height: 7),
                        _buildTextField(
                          controller: _subjectController,
                          hint: 'Brief subject of your feedback',
                        ),
                        const SizedBox(height: 16),
                        _buildInputLabel('Message *'),
                        const SizedBox(height: 7),
                        _buildTextField(
                          controller: _messageController,
                          hint: 'Please describe your feedback in detail...',
                          minLines: 4,
                          maxLines: null,
                          validator: (value) =>
                              (value == null || value.trim().isEmpty)
                                  ? 'Please enter your message'
                                  : null,
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _isSubmitting ? null : _submitFeedback,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF155DFC),
                              foregroundColor: const Color(0xFFFFFFFF),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 10,
                              ),
                            ),
                            child: _isSubmitting
                                ? const SizedBox(
                                    width: 18,
                                    height: 18,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor:
                                          AlwaysStoppedAnimation(Colors.white),
                                    ),
                                  )
                                : const Text(
                                    'Submit Feedback',
                                    style: TextStyle(
                                      fontSize: 14,
                                      height: 1,
                                      fontFamily: 'Arial',
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xFF102818),
        fontSize: 12,
        height: 1,
        fontFamily: 'Arial',
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
    int minLines = 1,
    int? maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF3F3F5),
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: Colors.transparent),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        minLines: minLines,
        maxLines: maxLines ?? minLines,
        style: const TextStyle(
          color: Color(0xFF717182),
          fontSize: 14,
          fontFamily: 'Arial',
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
            color: Color(0xFF717182),
            fontSize: 14,
            fontFamily: 'Arial',
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(12),
        ),
        validator: validator,
      ),
    );
  }
}
