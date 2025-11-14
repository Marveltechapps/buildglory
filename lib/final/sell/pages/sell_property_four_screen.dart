import 'package:buildglory/constant/constant.dart';
import 'package:buildglory/final/sell/bloc/sell_property_bloc.dart';
import 'package:buildglory/final/sell/bloc/sell_property_event.dart';
import 'package:buildglory/final/sell/bloc/sell_property_state.dart';
import 'package:buildglory/final/sell/model/sell_property_save_response_mode.dart';
import 'package:buildglory/final/sell/pages/sell_property_one_screen.dart';
import 'package:buildglory/final/sell/pages/sell_property_two_screen.dart';
import 'package:buildglory/final/sell/pages/sell_property_three_screen.dart';
import 'package:buildglory/new/presentation/profile/widgets/custom_input_field.dart';
import 'package:buildglory/screens/exchange/exchange_success_one_screen.dart';
import 'package:buildglory/screens/widgets/sell_property_succes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SellPropertyFourScreen extends StatefulWidget {
  const SellPropertyFourScreen({super.key});

  @override
  State<SellPropertyFourScreen> createState() => _SellPropertyFourScreenState();
}

class _SellPropertyFourScreenState extends State<SellPropertyFourScreen> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    
    // Always reload mobile number from login
    final mobile = prefs.getString('mobileNumber') ?? '';
    mobileController.text = mobile;
    
    // Load user name if available (only if field is empty)
    if (fullNameController.text.isEmpty) {
      final name = prefs.getString('userName') ?? '';
      fullNameController.text = name;
    }
    
    // Load email if available (only if field is empty)
    if (emailController.text.isEmpty) {
      final email = prefs.getString('userEmail') ?? '';
      emailController.text = email;
    }
    
    debugPrint("📱 Auto-filled from saved data:");
    debugPrint("  Mobile: $mobile");
    debugPrint("  Name: ${fullNameController.text}");
    debugPrint("  Email: ${emailController.text}");
  }

  void _clearAllFormData() {
    // Clear Screen 1 controllers
    SellPropertyOneScreen.builtUpAreaController.clear();
    SellPropertyOneScreen.carpetAreaController.clear();
    SellPropertyOneScreen.localityController.clear();
    SellPropertyOneScreen.projectController.clear();
    SellPropertyOneScreen.cityController.clear();
    SellPropertyOneScreen.bhktypeController.clear();
    
    // Clear Screen 2 controllers
    SellPropertyTwoScreen.expectedpriceController.clear();
    SellPropertyTwoScreen.ageofconstructionController.clear();
    SellPropertyTwoScreen.facingController.clear();
    SellPropertyTwoScreen.ownershipController.clear();
    SellPropertyTwoScreen.furnishedstatusController.clear();
    
    // Clear Screen 3 controllers
    SellPropertyThreeScreen.descriptionController.clear();
    
    // Clear Screen 4 controllers
    fullNameController.clear();
    mobileController.clear();
    emailController.clear();
    
    debugPrint("🧹 All form controllers cleared");
  }

  Map<String, String> _buildPropertySummary(
    SellPropertyBloc bloc,
    SellPropertySaveResponseModel? response,
  ) {
    String location = '';
    final locationParts = <String>[
      bloc.locality.trim(),
      bloc.selectedCity.trim(),
    ].where((element) => element.isNotEmpty).toList();
    if (locationParts.isNotEmpty) {
      location = locationParts.join(', ');
    }

    return {
      'propertyType': bloc.selectedPropertyType.trim(),
      'configuration': bloc.selectedBhkType.trim(),
      'location': location,
      'expectedPrice': bloc.expectedPrice.trim(),
      'ownerName': bloc.fullName.trim(),
      'contactNumber': bloc.mobileNumber.trim(),
      'sellId': response?.id ?? '',
    };
  }

  String _safeSummaryValue(String? value) {
    if (value == null) return '—';
    final trimmed = value.trim();
    return trimmed.isEmpty ? '—' : trimmed;
  }

  @override
  void dispose() {
    fullNameController.dispose();
    mobileController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SellPropertyBloc, SellPropertyState>(
        listener: (context, state) {
          if (state is SellPropertySaveSuccessState) {
            final bloc = context.read<SellPropertyBloc>();
            final summary =
                _buildPropertySummary(bloc, state.sellPropertySaveResponseModel);
            // Clear all form data
            _clearAllFormData();
            bloc.add(ClearSellPropertyDataEvent());
            
            // Show success message
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Property listed successfully!'),
                backgroundColor: Colors.green,
              ),
            );
            
            // Navigate to success screen
            flowname == "Sell"
                ? Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SellPropertySuccess();
                      },
                    ),
                  )
                : Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ExchangePropertyOneSuccfessPage(
                          propertyType: _safeSummaryValue(summary['propertyType']),
                          configuration: _safeSummaryValue(summary['configuration']),
                          location: _safeSummaryValue(summary['location']),
                          expectedPrice: _safeSummaryValue(summary['expectedPrice']),
                          ownerName: _safeSummaryValue(summary['ownerName']),
                          contactNumber: _safeSummaryValue(summary['contactNumber']),
                          sellId: summary['sellId'] ?? '',
                        );
                      },
                    ),
                  );
          } else if (state is SellErrorState) {
            // Show error message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMsg),
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 3),
              ),
            );
          } else if (state is SelectedOptionSuccessState) {
            if (state.selectedValue == "true") {
              context.read<SellPropertyBloc>().termsandconditon = true;
            } else {
              context.read<SellPropertyBloc>().termsandconditon = false;
            }
          }
        },
        builder: (context, state) {
          final isLoading = state is SellLoadingState;
          
          return Scaffold(
            backgroundColor: const Color(0xFFF9FAFB),
            body: Stack(
              children: [
                SafeArea(
              child: Column(
                children: [
                  // Header Section
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(color: Color(0xFFF3F4F6), width: 1),
                      ),
                    ),
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                    child: Column(
                      children: [
                        // Header with back button and title
                        SizedBox(
                          height: 42,
                          child: Row(
                            children: [
                              // Back button
                              Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(33554400),
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(Icons.arrow_back),
                                ),
                              ),
                              const SizedBox(width: 16),
                              // Title section
                              Expanded(
                                child: SizedBox(
                                  height: 42,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 25,
                                        child: const Text(
                                          'Property Details',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF1A1A1A),
                                            letterSpacing: -0.35,
                                            height: 1.4,
                                            fontFamily: 'Arial',
                                          ),
                                        ),
                                      ),
                                      const Text(
                                        'Step 4 of 4',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF4A5565),
                                          height: 1,
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
                        // Progress bar
                        Container(
                          margin: const EdgeInsets.only(top: 12),
                          height: 7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(33554400),
                            color: const Color(0xFFE5E7EB),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 77,
                                child: Container(
                                  height: 7,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      33554400,
                                    ),
                                    color: const Color(0xFF155DFC),
                                  ),
                                ),
                              ),
                              Expanded(flex: 23, child: Container()),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Content Section
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(20),
                      child: Center(
                        child: Column(
                          children: [
                            // Owner Details Card
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,
                                border: Border.all(
                                  color: const Color(0x1A000000),
                                  width: 1,
                                ),
                              ),
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Card header
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        profileblueIcon,
                                        width: 17,
                                        height: 18,
                                        fit: BoxFit.contain,
                                      ),
                                      const SizedBox(width: 8),
                                      const Expanded(
                                        child: Text(
                                          'Owner Details *',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF1A1A1A),
                                            height: 1.4,
                                            fontFamily: 'Arial',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  // Form fields
                                  SizedBox(
                                    // height: 207,
                                    child: Column(
                                      children: [
                                        // Full Name field
                                        CustomInputField(
                                          label: 'Full Name *',
                                          placeholder: 'Enter your full name',
                                          controller: fullNameController,
                                          sellPropertyBloc: context
                                              .read<SellPropertyBloc>(),
                                        ),
                                        const SizedBox(height: 14),
                                        // Mobile Number field
                                        CustomInputField(
                                          label: 'Mobile Number',
                                          placeholder:
                                              'Enter your mobile number',
                                          prefixIcon: true,
                                          controller: mobileController,
                                          prefix: SvgPicture.asset(
                                            callgreyIcon,
                                          ),
                                          sellPropertyBloc: context
                                              .read<SellPropertyBloc>(),
                                        ),
                                        const SizedBox(height: 14),
                                        // Email field
                                        CustomInputField(
                                          label: 'Email Address',
                                          placeholder:
                                              'Enter your email address',
                                          prefixIcon: true,
                                          controller: emailController,
                                          prefix: SvgPicture.asset(
                                            mailgreyIcon,
                                          ),
                                          sellPropertyBloc: context
                                              .read<SellPropertyBloc>(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 21),
                            // Terms & Agreement Card
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,
                                border: Border.all(
                                  color: const Color(0x1A000000),
                                  width: 1,
                                ),
                              ),
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Terms & Agreement',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF1A1A1A),
                                      height: 1.4,
                                      fontFamily: 'Arial',
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 17,
                                        height: 17,
                                        margin: const EdgeInsets.only(top: 1),
                                        child: Checkbox(
                                          value: context
                                              .read<SellPropertyBloc>()
                                              .termsandconditon,
                                          onChanged: (val) {
                                            context
                                                .read<SellPropertyBloc>()
                                                .add(
                                                  SelectOptionsEvent(
                                                    title: "Terms",
                                                    selectedValue: val
                                                        .toString(),
                                                  ),
                                                );
                                          },
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 1,
                                          ),
                                          child: RichText(
                                            text: const TextSpan(
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xFF364153),
                                                height: 20 / 12,
                                                fontFamily: 'Arial',
                                              ),
                                              children: [
                                                TextSpan(
                                                  text: 'I agree to the ',
                                                ),
                                                TextSpan(
                                                  text: 'Terms & Conditions ',
                                                  style: TextStyle(
                                                    decoration: TextDecoration
                                                        .underline,
                                                    color: Color(0xFF155DFC),
                                                  ),
                                                ),
                                                TextSpan(
                                                  text:
                                                      'and confirm that all information provided is accurate. I am the rightful owner of this property. *',
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            // Bottom buttons
                            Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      height: 42,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.white,
                                        border: Border.all(
                                          color: const Color(0x1A000000),
                                          width: 1,
                                        ),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'Previous',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF1A1A1A),
                                            fontFamily: 'Arial',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      final bloc = context.read<SellPropertyBloc>();
                                      
                                      // Validate required fields
                                      if (fullNameController.text.trim().isEmpty) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                            content: Text('Please enter your full name'),
                                            backgroundColor: Colors.orange,
                                          ),
                                        );
                                        return;
                                      }
                                      
                                      if (fullNameController.text.trim().length < 3) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                            content: Text('Name must be at least 3 characters'),
                                            backgroundColor: Colors.orange,
                                          ),
                                        );
                                        return;
                                      }
                                      
                                      if (mobileController.text.trim().isEmpty) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                            content: Text('Please enter mobile number'),
                                            backgroundColor: Colors.orange,
                                          ),
                                        );
                                        return;
                                      }
                                      
                                      // Validate mobile number (must be 10 digits)
                                      final mobile = mobileController.text.trim();
                                      if (mobile.length != 10 || !RegExp(r'^[0-9]+$').hasMatch(mobile)) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                            content: Text('Please enter a valid 10-digit mobile number'),
                                            backgroundColor: Colors.orange,
                                          ),
                                        );
                                        return;
                                      }
                                      
                                      // Validate email if provided
                                      if (emailController.text.trim().isNotEmpty) {
                                        final email = emailController.text.trim();
                                        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(
                                              content: Text('Please enter a valid email address'),
                                              backgroundColor: Colors.orange,
                                            ),
                                          );
                                          return;
                                        }
                                      }
                                      
                                      if (!bloc.termsandconditon) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                            content: Text('Please agree to Terms & Conditions'),
                                            backgroundColor: Colors.orange,
                                          ),
                                        );
                                        return;
                                      }
                                      
                                      // Save owner details to bloc before API call
                                      bloc.fullName = fullNameController.text.trim();
                                      bloc.mobileNumber = mobileController.text.trim();
                                      bloc.emailAddress = emailController.text.trim();
                                      
                                      debugPrint("✅ Screen 4 validation passed");
                                      debugPrint("Full Name: ${fullNameController.text}");
                                      debugPrint("Mobile: ${mobileController.text}");
                                      debugPrint("Email: ${emailController.text}");
                                      debugPrint("Terms Accepted: ${bloc.termsandconditon}");
                                      
                                      // Trigger API call
                                      bloc.add(SellPropertySaveEvent());
                                    },
                                    child: Container(
                                      height: 42,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: const Color(0xFF155DFC),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'Continue',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white,
                                            fontFamily: 'Arial',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ],
                ),
              ),
                // Loading Overlay
                if (isLoading)
                  Container(
                    color: Colors.black.withOpacity(0.5),
                    child: const Center(
                      child: Card(
                        margin: EdgeInsets.all(40),
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircularProgressIndicator(),
                              SizedBox(height: 16),
                              Text(
                                'Uploading property details...',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
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
          );
        },
      );
  }
}
