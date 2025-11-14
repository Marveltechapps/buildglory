import 'package:buildglory/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'custom_input_field.dart';

class ContactForm extends StatefulWidget {
  final String? initialFullName;
  final String? initialEmail;
  final String? initialPhone;
  final String? initialMessage;

  const ContactForm({
    super.key,
    this.initialFullName,
    this.initialEmail,
    this.initialPhone,
    this.initialMessage,
  });

  @override
  State<ContactForm> createState() => ContactFormState();
}

class ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fullNameController.text = widget.initialFullName ?? '';
    _emailController.text = widget.initialEmail ?? '';
    _phoneController.text = widget.initialPhone ?? '';
    _messageController.text = widget.initialMessage ?? '';
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Full Name Field
              CustomInputField(
                label: 'Full Name',
                isRequired: true,
                controller: _fullNameController,
                iconUrl: profilegreyIcon,
              ),
              const SizedBox(height: 16),

              // Email Field
              CustomInputField(
                label: 'Email Address',
                isRequired: true,
                controller: _emailController,
                iconUrl: mailgreyIcon,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),

              // Phone Field
              CustomInputField(
                label: 'Phone Number',
                isRequired: true,
                controller: _phoneController,
                iconUrl: callgreyIcon,
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Message (Optional)',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF364153),
                      fontFamily: 'Arial',
                    ),
                  ),
                  const SizedBox(height: 7),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      border: Border.all(
                        color: const Color(0xFFE5E7EB),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(14, 12, 0, 0),
                          child:
                              SvgPicture.asset(chatgreyIcon, width: 18, height: 18),
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: _messageController,
                            maxLines: 5,
                            minLines: 4,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Tell us more about your requirements...',
                              hintStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF717182),
                                fontFamily: 'Arial',
                              ),
                              contentPadding:
                                  EdgeInsets.fromLTRB(8, 12, 14, 12),
                            ),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF1A1A1A),
                              fontFamily: 'Arial',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Info Card
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xFFEFF6FF),
                  border: Border.all(color: const Color(0xFFDBEAFE), width: 1),
                ),
                padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
                child: const Text(
                  'Our team will contact you within 2 hours during business hours (9 AM - 7 PM)',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF193CB8),
                    fontFamily: 'Arial',
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool validate() {
    return _formKey.currentState?.validate() ?? false;
  }

  Map<String, String> getFormData() {
    return {
      'fullName': _fullNameController.text.trim(),
      'email': _emailController.text.trim(),
      'phone': _phoneController.text.trim(),
      'message': _messageController.text.trim(),
    };
  }
}
