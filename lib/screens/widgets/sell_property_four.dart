import 'package:buildglory/constant/constant.dart';
import 'package:buildglory/new/presentation/profile/widgets/custom_input_field.dart';
import 'package:buildglory/screens/exchange/exchange_success_one_screen.dart';
import 'package:buildglory/screens/widgets/sell_property_succes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SellPropertyFour extends StatefulWidget {
  const SellPropertyFour({super.key});

  @override
  State<SellPropertyFour> createState() => _SellPropertyFormPageState();
}

class _SellPropertyFormPageState extends State<SellPropertyFour> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _mobileController.text = '+91 98765 43210';
    _emailController.text = 'your.email@example.com';
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
      body: SafeArea(
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
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                              borderRadius: BorderRadius.circular(33554400),
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
                                    controller: _fullNameController,
                                  ),
                                  const SizedBox(height: 14),
                                  // Mobile Number field
                                  CustomInputField(
                                    label: 'Mobile Number',
                                    placeholder: 'Enter your mobile number',
                                    prefixIcon: true,
                                    controller: _mobileController,
                                    prefix: SvgPicture.asset(callgreyIcon),
                                  ),
                                  const SizedBox(height: 14),
                                  // Email field
                                  CustomInputField(
                                    label: 'Email Address',
                                    placeholder: 'Enter your email address',
                                    prefixIcon: true,
                                    controller: _emailController,
                                    prefix: SvgPicture.asset(mailgreyIcon),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 17,
                                  height: 17,
                                  margin: const EdgeInsets.only(top: 1),

                                  child: Checkbox(
                                    value: false,
                                    onChanged: (val) {},
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
                                          TextSpan(text: 'I agree to the '),
                                          TextSpan(
                                            text: 'Terms & Conditions ',
                                            style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
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
                                            return ExchangePropertyOneSuccfessPage();
                                          },
                                        ),
                                      );
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
    );
  }
}
