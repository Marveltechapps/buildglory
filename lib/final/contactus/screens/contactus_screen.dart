import 'package:buildglory/constant/constant.dart';
import 'package:buildglory/final/contactus/bloc/contactus_bloc.dart';
import 'package:buildglory/final/contactus/bloc/contactus_event.dart';
import 'package:buildglory/final/contactus/bloc/contactus_state.dart';
import 'package:buildglory/generated/api_client_factory.dart';
import 'package:buildglory/screens/exchange/exchange_success_two_screen.dart';
import 'package:buildglory/screens/residential/contactus/contact_form.dart';
import 'package:buildglory/screens/residential/contactus/property_card.dart';
import 'package:buildglory/screens/residential/submit/submit_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactusScreen extends StatefulWidget {
  final String colorcode;
  final String? title;
  final String propertyid;
  final String type;
  final String propertyTitle;
  final String propertyLocation;
  final String propertyPrice;
  final String propertyImageUrl;
  final String? initialFullName;
  final String? initialEmail;
  final String? initialPhone;
  final String? initialMessage;

  const ContactusScreen({
    super.key,
    required this.colorcode,
    this.title,
    required this.propertyid,
    required this.type,
    required this.propertyTitle,
    required this.propertyLocation,
    required this.propertyPrice,
    required this.propertyImageUrl,
    this.initialFullName,
    this.initialEmail,
    this.initialPhone,
    this.initialMessage,
  });

  @override
  State<ContactusScreen> createState() => _ContactusScreenState();
}

class _ContactusScreenState extends State<ContactusScreen> {
  final GlobalKey<ContactFormState> _contactFormKey =
      GlobalKey<ContactFormState>();

  String fullName = '';
  String email = '';
  String phone = '';
  String message = '';

  @override
  void initState() {
    super.initState();
    fullName = widget.initialFullName ?? '';
    email = widget.initialEmail ?? '';
    phone = widget.initialPhone ?? '';
    message = widget.initialMessage ?? '';
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      if (fullName.isEmpty) {
        fullName = prefs.getString('userName') ?? '';
      }
      if (email.isEmpty) {
        email = prefs.getString('userEmail') ?? '';
      }
      if (phone.isEmpty) {
        phone = prefs.getString('mobileNumber') ?? '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Create API client factory to get EnquiryService
    final apiFactory = ApiClientFactory(
      baseUrl: 'http://3.6.250.39:6000/api',
    );

    return BlocProvider(
      create: (context) => ContactusBloc(
        enquiryService: apiFactory.enquiry,
      ),
      child: BlocConsumer<ContactusBloc, ContactusState>(
        listener: (context, state) {
          if (state is ContactDataApiSuccessState) {
            final referenceNumber =
                'REF-${DateTime.now().millisecondsSinceEpoch.toString().substring(5)}';
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return widget.title == "Apartments Details"
                      ? ExchangeSuccessTwoScreen()
                      : SimpleConfirmationPage(
                          colorcode: widget.colorcode,
                          propertyTitle: widget.propertyTitle,
                          propertyLocation: widget.propertyLocation,
                          propertyPrice: widget.propertyPrice,
                          propertyImageUrl: widget.propertyImageUrl,
                          userName: fullName.isNotEmpty
                              ? fullName
                              : 'Valued Customer',
                          userPhone: phone.isNotEmpty ? phone : '—',
                          userEmail: email.isNotEmpty ? email : '—',
                          message: message,
                          referenceNumber: referenceNumber,
                        );
                },
              ),
            );
          } else if (state is ContactusErrorState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMsg)));
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color(0xFFF9FAFB),
            appBar: AppBar(
              backgroundColor: const Color(0xFFF9FAFB),
              title: Row(
                children: [
                  Text(
                    "Contact Us - Property",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1A1A1A),
                      letterSpacing: -0.35,
                      height: 1.4,
                      fontFamily: 'Arial',
                    ),
                  ),
                ],
              ),
            ),
            body: SafeArea(
              child: Column(
                children: [
                  // Header
                  Container(
                    width: double.infinity,
                    color: Color(int.parse(widget.colorcode)),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const SizedBox(height: 21),
                        PropertyCard(
                          title: widget.propertyTitle,
                          location: widget.propertyLocation,
                          price: widget.propertyPrice,
                          imageUrl: widget.propertyImageUrl,
                        ),
                      ],
                    ),
                  ),
                  // Contact Form
                  Expanded(
                    child: ContactForm(
                      key: _contactFormKey,
                      initialFullName: fullName,
                      initialEmail: email,
                      initialPhone: phone,
                      initialMessage: message,
                    ),
                  ),
                  // Submit Button
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Color(0xFFF3F4F6), width: 1),
                      ),
                    ),
                    padding: const EdgeInsets.all(16),
                    child: ElevatedButton(
                      onPressed: () {
                        final formState = _contactFormKey.currentState;
                        if (formState == null) return;
                        if (!formState.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Please fill the required details'),
                              backgroundColor: Colors.orange,
                            ),
                          );
                          return;
                        }
                        final formValues = formState.getFormData();
                        setState(() {
                          fullName = formValues['fullName'] ?? '';
                          email = formValues['email'] ?? '';
                          phone = formValues['phone'] ?? '';
                          message = formValues['message'] ?? '';
                        });
                        context.read<ContactusBloc>().add(
                              SaveContactDataApiEvent(
                                propertyId: widget.propertyid,
                                type: widget.type,
                                message: message,
                              ),
                            );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(int.parse(widget.colorcode)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16777200),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 13),
                        elevation: 0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            callwhiteIcon,
                            width: 14,
                            height: 14,
                          ),
                          const SizedBox(width: 16),
                          const Text(
                            'Submit Inquiry',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
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
          );
        },
      ),
    );
  }
}
