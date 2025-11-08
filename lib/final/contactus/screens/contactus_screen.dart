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

class ContactusScreen extends StatelessWidget {
  final String colorcode;
  final String? title;
  final String propertyid;
  final String type;
  const ContactusScreen({
    super.key,
    required this.colorcode,
    this.title,
    required this.propertyid,
    required this.type,
  });

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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return title == "Apartments Details"
                      ? ExchangeSuccessTwoScreen()
                      : SimpleConfirmationPage(colorcode: colorcode);
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
                    color: Color(int.parse(colorcode)),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        // Header with back button and title
                        const SizedBox(height: 21),
                        // Property Card
                        const PropertyCard(),
                      ],
                    ),
                  ),
                  // Contact Form
                  const Expanded(child: ContactForm()),
                  // Submit Button
                  InkWell(
                    onTap: () {
                      context.read<ContactusBloc>().add(
                        SaveContactDataApiEvent(
                          propertyId: propertyid,
                          type: type,
                          message: "",
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      //    color: Colors.white,
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Color(0xFFF3F4F6), width: 1),
                        ),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16777200),
                          color: Color(int.parse(colorcode)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 13),
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
                                'Submit In quiry',
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
