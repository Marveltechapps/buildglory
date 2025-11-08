import 'package:buildglory/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'custom_input_field.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Set default values as shown in design
    _fullNameController.text = 'dacasc';
    _emailController.text = 'dacasc';
    _phoneController.text = 'dacasc';
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
              ),
              const SizedBox(height: 16),

              // Phone Field
              CustomInputField(
                label: 'Phone Number',
                isRequired: true,
                controller: _phoneController,
                iconUrl: callgreyIcon,
              ),
              const SizedBox(height: 16),

              // Message Field
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
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(14, 8, 14, 91),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(chatgreyIcon, width: 18, height: 18),
                          const SizedBox(width: 8),
                          const Expanded(
                            child: Text(
                              'Tell us more about your requireme nts...',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF717182),
                                fontFamily: 'Arial',
                              ),
                            ),
                          ),
                        ],
                      ),
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
}
