import 'package:buildglory/final/sell/pages/sell_property_four_screen.dart';
import 'package:flutter/material.dart';

class SellPropertyThirdPage extends StatefulWidget {
  const SellPropertyThirdPage({super.key});

  @override
  State<SellPropertyThirdPage> createState() => _SellPropertyFormPageState();
}

class _SellPropertyFormPageState extends State<SellPropertyThirdPage> {
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
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
                          child: Center(child: Icon(Icons.arrow_back)),
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
                padding: const EdgeInsets.symmetric(vertical: 18),
                child: Column(
                  children: [
                    // Form Content
                    Container(
                      width: 342,
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
                              constraints: const BoxConstraints(maxWidth: 340),
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
                                      controller: _descriptionController,
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
                              constraints: const BoxConstraints(maxWidth: 340),
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
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
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
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 12),
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
                            const SizedBox(width: 11),
                            // Continue Button
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return SellPropertyFourScreen();
                                      },
                                    ),
                                  );
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
