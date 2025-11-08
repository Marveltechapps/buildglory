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

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submitFeedback() {
    if (_formKey.currentState!.validate()) {
      // Handle form submission
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Feedback submitted successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9FAFB),
        title: Text(
          'Submit Feedback',
          style: TextStyle(
            fontFamily: 'Arial',
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF1A1A1A),
            letterSpacing: -0.35,
            height: 1,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          //    constraints: const BoxConstraints(maxWidth: 480),
          margin: const EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            children: [
              // Content
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title Section
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
                        // Full Name Field
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Full Name *',
                              style: TextStyle(
                                color: Color(0xFF102818),
                                fontSize: 12,
                                height: 1,
                                fontFamily: 'Arial',
                              ),
                            ),
                            const SizedBox(height: 7),
                            Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFF3F3F5),
                                borderRadius: BorderRadius.circular(7),
                                border: Border.all(color: Colors.transparent),
                              ),
                              child: TextFormField(
                                controller: _fullNameController,
                                style: const TextStyle(
                                  color: Color(0xFF717182),
                                  fontSize: 14,
                                  fontFamily: 'Arial',
                                ),
                                decoration: const InputDecoration(
                                  hintText: 'Enter your full name',
                                  hintStyle: TextStyle(
                                    color: Color(0xFF717182),
                                    fontSize: 14,
                                    fontFamily: 'Arial',
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(12),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your full name';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        // Email Field
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Email Address *',
                              style: TextStyle(
                                color: Color(0xFF102818),
                                fontSize: 12,
                                height: 1,
                                fontFamily: 'Arial',
                              ),
                            ),
                            const SizedBox(height: 7),
                            Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFF3F3F5),
                                borderRadius: BorderRadius.circular(7),
                                border: Border.all(color: Colors.transparent),
                              ),
                              child: TextFormField(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                style: const TextStyle(
                                  color: Color(0xFF717182),
                                  fontSize: 14,
                                  fontFamily: 'Arial',
                                ),
                                decoration: const InputDecoration(
                                  hintText: 'Enter your email address',
                                  hintStyle: TextStyle(
                                    color: Color(0xFF717182),
                                    fontSize: 14,
                                    fontFamily: 'Arial',
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(12),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email address';
                                  }
                                  if (!RegExp(
                                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                                  ).hasMatch(value)) {
                                    return 'Please enter a valid email address';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        // Subject Field
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Subject',
                              style: TextStyle(
                                color: Color(0xFF102818),
                                fontSize: 12,
                                height: 1,
                                fontFamily: 'Arial',
                              ),
                            ),
                            const SizedBox(height: 7),
                            Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFF3F3F5),
                                borderRadius: BorderRadius.circular(7),
                                border: Border.all(color: Colors.transparent),
                              ),
                              child: TextFormField(
                                controller: _subjectController,
                                style: const TextStyle(
                                  color: Color(0xFF717182),
                                  fontSize: 14,
                                  fontFamily: 'Arial',
                                ),
                                decoration: const InputDecoration(
                                  hintText: 'Brief subject of your feedback',
                                  hintStyle: TextStyle(
                                    color: Color(0xFF717182),
                                    fontSize: 14,
                                    fontFamily: 'Arial',
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(12),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        // Message Field
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Message *',
                              style: TextStyle(
                                color: Color(0xFF102818),
                                fontSize: 12,
                                height: 1,
                                fontFamily: 'Arial',
                              ),
                            ),
                            const SizedBox(height: 7),
                            Container(
                              constraints: const BoxConstraints(minHeight: 97),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF3F3F5),
                                borderRadius: BorderRadius.circular(7),
                                border: Border.all(color: Colors.transparent),
                              ),
                              child: TextFormField(
                                controller: _messageController,
                                maxLines: null,
                                minLines: 4,
                                style: const TextStyle(
                                  color: Color(0xFF717182),
                                  fontSize: 14,
                                  fontFamily: 'Arial',
                                ),
                                decoration: const InputDecoration(
                                  hintText:
                                      'Please describe your feedback in detail...',
                                  hintStyle: TextStyle(
                                    color: Color(0xFF717182),
                                    fontSize: 14,
                                    fontFamily: 'Arial',
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(12),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your message';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        // Submit Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return FeedbackSentScreen();
                                  },
                                ),
                              );
                            },
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
                            child: const Text(
                              'Submit Feedback',
                              style: TextStyle(
                                fontSize: 14,
                                height: 1,
                                fontFamily: 'Arial',
                              ),
                              textAlign: TextAlign.center,
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
}
