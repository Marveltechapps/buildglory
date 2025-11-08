import 'package:buildglory/presentation/sellproperythirdstep/widgets/sell_property_third_page.dart';
import 'package:flutter/material.dart';
import '../widgets/progress_bar.dart';
import '../widgets/form_card.dart';
import '../widgets/custom_dropdown.dart';
import '../widgets/custom_checkbox.dart';

class SellPropertySecondPage extends StatefulWidget {
  const SellPropertySecondPage({super.key});

  @override
  State<SellPropertySecondPage> createState() => _SellPropertyFormPageState();
}

class _SellPropertyFormPageState extends State<SellPropertySecondPage> {
  final TextEditingController _priceController = TextEditingController(
    text: '85,00,000',
  );
  bool _priceNegotiable = false;
  String? _ageOfConstruction;
  String? _facing;
  String? _ownership;
  String? _furnishedStatus;

  // Amenities checkboxes
  bool _swimmingPool = false;
  bool _gym = false;
  bool _parking = false;
  bool _security = false;
  bool _powerBackup = false;
  bool _lift = false;
  bool _garden = false;
  bool _playground = false;
  bool _clubhouse = false;
  bool _maintenance = false;
  bool _waterSupply = false;
  bool _intercom = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 480),
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
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // Header with back button and title
                    Row(
                      children: [
                        Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(33554400),
                          ),
                          child: Center(child: Icon(Icons.arrow_back)),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Property Details',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xFF0A0A0A),
                                  fontFamily: 'Arial',
                                  fontWeight: FontWeight.w400,
                                  height: 1.4,
                                ),
                              ),
                              const SizedBox(height: 1),
                              const Text(
                                'Step 2 of 4',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF4A5565),
                                  fontFamily: 'Arial',
                                  fontWeight: FontWeight.w400,
                                  height: 1.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    // Progress Bar
                    const CustomProgressBar(
                      progress: 0.5, // 50% progress for step 2 of 4
                    ),
                  ],
                ),
              ),

              // Form Content
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      // Pricing Information Card
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: FormCard(
                          title: 'Pricing Information',
                          isRequired: true,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Expected Price *',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF0A0A0A),
                                  fontFamily: 'Arial',
                                  height: 1.0,
                                ),
                              ),
                              const SizedBox(height: 7),
                              Stack(
                                children: [
                                  Container(
                                    height: 31,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFF3F3F5),
                                      borderRadius: BorderRadius.circular(7),
                                      border: Border.all(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),
                                    ),
                                    child: TextField(
                                      controller: _priceController,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFF717182),
                                        fontFamily: 'Arial',
                                      ),
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 28,
                                          vertical: 9,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Positioned(
                                    left: 11,
                                    top: 6,
                                    child: Text(
                                      '₹',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFF6A7282),
                                        fontFamily: 'Arial',
                                        height: 1.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 14),
                              CustomCheckbox(
                                value: _priceNegotiable,
                                onChanged: (value) {
                                  setState(() {
                                    _priceNegotiable = value ?? false;
                                  });
                                },
                                label: 'Price Negotiable',
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 18),

                      // Additional Details Card
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: FormCard(
                          title: 'Additional Details',
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Age of Construction
                              const Text(
                                'Age of Construction',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF0A0A0A),
                                  fontFamily: 'Arial',
                                  height: 1.0,
                                ),
                              ),
                              const SizedBox(height: 7),
                              CustomDropdown(
                                placeholder: 'Select age',
                                value: _ageOfConstruction,
                                items: const [
                                  '0-1 years',
                                  '1-5 years',
                                  '5-10 years',
                                  '10+ years',
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    _ageOfConstruction = value;
                                  });
                                },
                              ),

                              const SizedBox(height: 12),

                              // Facing and Ownership in a row
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Facing',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFF0A0A0A),
                                            fontFamily: 'Arial',
                                            height: 1.0,
                                          ),
                                        ),
                                        const SizedBox(height: 7),
                                        CustomDropdown(
                                          placeholder: 'Select facing',
                                          value: _facing,
                                          items: const [
                                            'North',
                                            'South',
                                            'East',
                                            'West',
                                          ],
                                          onChanged: (value) {
                                            setState(() {
                                              _facing = value;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Ownership',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFF0A0A0A),
                                            fontFamily: 'Arial',
                                            height: 1.0,
                                          ),
                                        ),
                                        const SizedBox(height: 7),
                                        CustomDropdown(
                                          placeholder: 'Select type',
                                          value: _ownership,
                                          items: const [
                                            'Freehold',
                                            'Leasehold',
                                            'Co-operative',
                                          ],
                                          onChanged: (value) {
                                            setState(() {
                                              _ownership = value;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 12),

                              // Furnished Status
                              const Text(
                                'Furnished Status',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF0A0A0A),
                                  fontFamily: 'Arial',
                                  height: 1.0,
                                ),
                              ),
                              const SizedBox(height: 7),
                              CustomDropdown(
                                placeholder: 'Select status',
                                value: _furnishedStatus,
                                items: const [
                                  'Furnished',
                                  'Semi-Furnished',
                                  'Unfurnished',
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    _furnishedStatus = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 18),

                      // Amenities Card
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: FormCard(
                          title: 'Amenities',
                          child: Column(
                            children: [
                              // Row 1
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomCheckbox(
                                      value: _swimmingPool,
                                      onChanged: (value) {
                                        setState(() {
                                          _swimmingPool = value ?? false;
                                        });
                                      },
                                      label: 'Swimming Pool',
                                    ),
                                  ),
                                  Expanded(
                                    child: CustomCheckbox(
                                      value: _gym,
                                      onChanged: (value) {
                                        setState(() {
                                          _gym = value ?? false;
                                        });
                                      },
                                      label: 'Gym',
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),

                              // Row 2
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomCheckbox(
                                      value: _parking,
                                      onChanged: (value) {
                                        setState(() {
                                          _parking = value ?? false;
                                        });
                                      },
                                      label: 'Parking',
                                    ),
                                  ),
                                  Expanded(
                                    child: CustomCheckbox(
                                      value: _security,
                                      onChanged: (value) {
                                        setState(() {
                                          _security = value ?? false;
                                        });
                                      },
                                      label: 'Security',
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),

                              // Row 3
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomCheckbox(
                                      value: _powerBackup,
                                      onChanged: (value) {
                                        setState(() {
                                          _powerBackup = value ?? false;
                                        });
                                      },
                                      label: 'Power Backup',
                                    ),
                                  ),
                                  Expanded(
                                    child: CustomCheckbox(
                                      value: _lift,
                                      onChanged: (value) {
                                        setState(() {
                                          _lift = value ?? false;
                                        });
                                      },
                                      label: 'Lift',
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),

                              // Row 4
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomCheckbox(
                                      value: _garden,
                                      onChanged: (value) {
                                        setState(() {
                                          _garden = value ?? false;
                                        });
                                      },
                                      label: 'Garden',
                                    ),
                                  ),
                                  Expanded(
                                    child: CustomCheckbox(
                                      value: _playground,
                                      onChanged: (value) {
                                        setState(() {
                                          _playground = value ?? false;
                                        });
                                      },
                                      label: 'Playground',
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),

                              // Row 5
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomCheckbox(
                                      value: _clubhouse,
                                      onChanged: (value) {
                                        setState(() {
                                          _clubhouse = value ?? false;
                                        });
                                      },
                                      label: 'Clubhouse',
                                    ),
                                  ),
                                  Expanded(
                                    child: CustomCheckbox(
                                      value: _maintenance,
                                      onChanged: (value) {
                                        setState(() {
                                          _maintenance = value ?? false;
                                        });
                                      },
                                      label: 'Maintenance',
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 11),

                              // Row 6
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomCheckbox(
                                      value: _waterSupply,
                                      onChanged: (value) {
                                        setState(() {
                                          _waterSupply = value ?? false;
                                        });
                                      },
                                      label: 'Water Supply',
                                    ),
                                  ),
                                  Expanded(
                                    child: CustomCheckbox(
                                      value: _intercom,
                                      onChanged: (value) {
                                        setState(() {
                                          _intercom = value ?? false;
                                        });
                                      },
                                      label: 'Intercom',
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 18),

                      // Footer with buttons
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            top: BorderSide(color: Color(0x1A000000), width: 1),
                          ),
                        ),
                        padding: const EdgeInsets.all(18),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 42,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(7),
                                  border: Border.all(
                                    color: const Color(0x1A000000),
                                    width: 1,
                                  ),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Previous',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF0A0A0A),
                                      fontFamily: 'Arial',
                                      height: 1.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 11),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return SellPropertyThirdPage();
                                      },
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 42,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF155DFC),
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Continue',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontFamily: 'Arial',
                                        height: 1.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
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
    );
  }

  @override
  void dispose() {
    _priceController.dispose();
    super.dispose();
  }
}
