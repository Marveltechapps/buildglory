import 'package:buildglory/final/sell/bloc/sell_property_bloc.dart';
import 'package:buildglory/final/sell/bloc/sell_property_event.dart';
import 'package:buildglory/final/sell/bloc/sell_property_state.dart';
import 'package:buildglory/final/sell/pages/sell_property_three_screen.dart';
import 'package:buildglory/new/presentation/profile/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SellPropertyTwoScreen extends StatelessWidget {
  const SellPropertyTwoScreen({super.key});

  static TextEditingController expectedpriceController =
      TextEditingController();
  static TextEditingController ageofconstructionController =
      TextEditingController();
  static TextEditingController facingController = TextEditingController();
  static TextEditingController ownershipController = TextEditingController();
  static TextEditingController furnishedstatusController =
      TextEditingController();

  // Age of Construction options
  final List<String> ageOfConstructionOptions = const [
    '0-1 years',
    '1-5 years',
    '5-10 years',
    '10-15 years',
    '15-20 years',
    '20-25 years',
    '25+ years',
    'Under Construction',
  ];

  // Facing options
  final List<String> facingOptions = const [
    'North',
    'South',
    'East',
    'West',
    'North-East',
    'North-West',
    'South-East',
    'South-West',
  ];

  // Ownership options
  final List<String> ownershipOptions = const [
    'Freehold',
    'Leasehold',
    'Co-operative',
    'Power of Attorney',
  ];

  // Furnished Status options
  final List<String> furnishedStatusOptions = const [
    'Fully Furnished',
    'Semi Furnished',
    'Unfurnished',
  ];

  void _showOptionsBottomSheet(
    BuildContext context,
    String title,
    List<String> options,
    TextEditingController controller,
    SellPropertyBloc bloc,
  ) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return SafeArea(
          child: DraggableScrollableSheet(
            initialChildSize: 0.6,
            minChildSize: 0.3,
            maxChildSize: 0.9,
            expand: false,
            builder: (context, scrollController) {
              return Column(
                children: [
                  // Handle bar
                  Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(top: 10, bottom: 20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE5E7EB),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  // Title
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Select $title',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF0A0A0A),
                        fontFamily: 'Arial',
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Options List
                  Expanded(
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: options.length,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      itemBuilder: (context, index) {
                        final option = options[index];
                        final isSelected = controller.text == option;
                        
                        return ListTile(
                          title: Text(
                            option,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
                              color: isSelected ? const Color(0xFF155DFC) : const Color(0xFF0A0A0A),
                              fontFamily: 'Arial',
                            ),
                          ),
                          trailing: isSelected
                              ? const Icon(
                                  Icons.check_circle,
                                  color: Color(0xFF155DFC),
                                )
                              : null,
                          onTap: () {
                            controller.text = option;
                            
                            // Update bloc based on field type
                            if (title == 'Age of Construction') {
                              bloc.ageOfConstrution = option;
                            } else if (title == 'Facing') {
                              bloc.facing = option;
                            } else if (title == 'Ownership') {
                              bloc.ownership = option;
                            } else if (title == 'Furnished Status') {
                              bloc.furnishedStatus = option;
                            }
                            
                            Navigator.pop(context);
                          },
                        );
                      },
                    ),
                  ),
                  // Bottom padding for safe area
                  const SizedBox(height: 10),
                ],
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildHeader(context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Color(0xFFF3F4F6), width: 1)),
      ),
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: Column(
        children: [
          SizedBox(
            height: 42,
            child: Row(
              children: [
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 25,
                        child: const Text(
                          'Property Details',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF1A1A1A),
                            letterSpacing: -0.35,
                            height: 1.4,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Step 2 of 4',
                            style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF4A5565),
                              height: 1,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          Container(
            height: 7,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(33554400),
              color: const Color(0xFFE5E7EB),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(33554400),
                      color: const Color(0xFF155DFC),
                    ),
                  ),
                ),
                const Expanded(flex: 3, child: SizedBox()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPricingCard(SellPropertyBloc sellpropertybloc) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: Border.all(color: const Color(0x1A000000), width: 1),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Pricing Information *',
            style: TextStyle(
              fontFamily: 'Arial',
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Color(0xFF1A1A1A),
              height: 1.4,
            ),
          ),
          const SizedBox(height: 12),
          CustomInputField(
            label: 'Expected Price *',
            placeholder: ' 85,00,000',
            showsymbol: true,
            controller: expectedpriceController,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                width: 18,
                height: 17,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: const Color(0xFFF3F3F5),
                  border: Border.all(color: const Color(0x1A000000), width: 1),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x0D000000),
                      offset: const Offset(0, 1),
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: Checkbox(
                  value: sellpropertybloc.priceNegotiable,
                  onChanged: (value) {
                    sellpropertybloc.add(
                      SelectOptionsEvent(
                        title: "PriceNegotiable",
                        selectedValue: (value ?? false).toString(),
                      ),
                    );
                  },
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity: VisualDensity.compact,
                  activeColor: Colors.transparent,
                  checkColor: const Color(0xFF155DFC),
                  side: BorderSide.none,
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'Price Negotiable',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF1A1A1A),
                  height: 1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAdditionalDetailsCard(BuildContext context, SellPropertyBloc bloc) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: Border.all(color: const Color(0x1A000000), width: 1),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Additional Details',
            style: TextStyle(
              fontFamily: 'Arial',
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Color(0xFF1A1A1A),
              height: 1.4,
            ),
          ),
          const SizedBox(height: 14),

          GestureDetector(
            onTap: () => _showOptionsBottomSheet(
              context,
              'Age of Construction',
              ageOfConstructionOptions,
              ageofconstructionController,
              bloc,
            ),
            child: AbsorbPointer(
              child: CustomInputField(
                label: 'Age of Construction',
                placeholder: 'Select age',
                readonly: true,
                controller: ageofconstructionController,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => _showOptionsBottomSheet(
                    context,
                    'Facing',
                    facingOptions,
                    facingController,
                    bloc,
                  ),
                  child: AbsorbPointer(
                    child: CustomInputField(
                      label: 'Facing',
                      placeholder: 'Select facing',
                      readonly: true,
                      controller: facingController,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),

              Expanded(
                child: GestureDetector(
                  onTap: () => _showOptionsBottomSheet(
                    context,
                    'Ownership',
                    ownershipOptions,
                    ownershipController,
                    bloc,
                  ),
                  child: AbsorbPointer(
                    child: CustomInputField(
                      label: 'Ownership',
                      placeholder: 'Select type',
                      readonly: true,
                      controller: ownershipController,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          GestureDetector(
            onTap: () => _showOptionsBottomSheet(
              context,
              'Furnished Status',
              furnishedStatusOptions,
              furnishedstatusController,
              bloc,
            ),
            child: AbsorbPointer(
              child: CustomInputField(
                label: 'Furnished Status',
                placeholder: 'Select status',
                readonly: true,
                controller: furnishedstatusController,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAmenitiesCard(SellPropertyBloc sellpropertybloc) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: Border.all(color: const Color(0x1A000000), width: 1),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Amenities',
            style: TextStyle(
              fontFamily: 'Arial',
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Color(0xFF1A1A1A),
              height: 1.4,
            ),
          ),
          const SizedBox(height: 12),
          _buildAmenitiesGrid(sellpropertybloc),
        ],
      ),
    );
  }

  Widget _buildAmenitiesGrid(SellPropertyBloc sellpropertybloc) {
    List<String> amenityKeys = sellpropertybloc.amenities;

    return Column(
      children: [
        for (int i = 0; i < amenityKeys.length; i += 2)
          Padding(
            padding: EdgeInsets.only(
              bottom: i < amenityKeys.length - 2 ? 12 : 0,
            ),
            child: Row(
              children: [
                Expanded(
                  child: _buildAmenityCheckbox(
                    amenityKeys[i],
                    sellpropertybloc,
                  ),
                ),
                if (i + 1 < amenityKeys.length) ...[
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildAmenityCheckbox(
                      amenityKeys[i + 1],
                      sellpropertybloc,
                    ),
                  ),
                ] else
                  const Expanded(child: SizedBox()),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildAmenityCheckbox(
    String amenity,
    SellPropertyBloc sellpropertybloc,
  ) {
    return Row(
      children: [
        Container(
          width: 18,
          height: 17,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: const Color(0xFFF3F3F5),
            border: Border.all(color: const Color(0x1A000000), width: 1),
            boxShadow: [
              BoxShadow(
                color: const Color(0x0D000000),
                offset: const Offset(0, 1),
                blurRadius: 2,
              ),
            ],
          ),
          child: Checkbox(
            value: sellpropertybloc.amenitiesSelectedList.contains(amenity),
            onChanged: (value) {
              sellpropertybloc.add(
                SelectOptionsEvent(title: "Amenities", selectedValue: amenity),
              );
            },
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
            activeColor: Colors.transparent,
            checkColor: const Color(0xFF155DFC),
            side: BorderSide.none,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            amenity,
            style: const TextStyle(
              fontFamily: 'Arial',
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xFF1A1A1A),
              height: 1,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomButtons(SellPropertyBloc sellPropertyBloc, context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 42,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              border: Border.all(color: const Color(0x1A000000), width: 1),
            ),
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 11,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Previous',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF1A1A1A),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Container(
            height: 42,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xFF155DFC),
            ),
            child: TextButton(
              onPressed: () {
                final bloc = sellPropertyBloc;
                
                // Validation
                if (expectedpriceController.text.trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please enter Expected Price'),
                      backgroundColor: Colors.orange,
                    ),
                  );
                  return;
                }
                
                // Check if price is a valid number
                final price = double.tryParse(expectedpriceController.text.replaceAll(',', ''));
                if (price == null || price <= 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please enter a valid price'),
                      backgroundColor: Colors.orange,
                    ),
                  );
                  return;
                }
                
                if (ageofconstructionController.text.trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please select Age of Construction'),
                      backgroundColor: Colors.orange,
                    ),
                  );
                  return;
                }
                
                if (facingController.text.trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please select Facing direction'),
                      backgroundColor: Colors.orange,
                    ),
                  );
                  return;
                }
                
                if (ownershipController.text.trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please select Ownership type'),
                      backgroundColor: Colors.orange,
                    ),
                  );
                  return;
                }
                
                if (furnishedstatusController.text.trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please select Furnished Status'),
                      backgroundColor: Colors.orange,
                    ),
                  );
                  return;
                }
                
                // Save data to bloc before navigating
                bloc.expectedPrice = expectedpriceController.text;
                bloc.ageOfConstrution = ageofconstructionController.text;
                bloc.facing = facingController.text;
                bloc.ownership = ownershipController.text;
                bloc.furnishedStatus = furnishedstatusController.text;

                debugPrint("✅ Screen 2 validation passed");
                debugPrint("Expected Price: ${expectedpriceController.text}");
                debugPrint("Age of Construction: ${ageofconstructionController.text}");
                debugPrint("Amenities: ${bloc.amenitiesSelectedList}");

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return BlocProvider.value(
                        value: bloc,
                        child: SellPropertyThreeScreen(),
                      );
                    },
                  ),
                );
              },
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 11,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Continue',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SellPropertyBloc, SellPropertyState>(
        listener: (context, state) {
          if (state is SelectedOptionSuccessState) {
            if (state.title == "Amenities") {
              final bloc = context.read<SellPropertyBloc>();
              // Toggle amenity selection
              if (bloc.amenitiesSelectedList.contains(state.selectedValue)) {
                bloc.amenitiesSelectedList.remove(state.selectedValue);
              } else {
                bloc.amenitiesSelectedList.add(state.selectedValue);
              }
            } else if (state.title == "PriceNegotiable") {
              context.read<SellPropertyBloc>().priceNegotiable =
                  state.selectedValue == "true";
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color(0xFFF9FAFB),
            body: SafeArea(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 480),
                child: Column(
                  children: [
                    _buildHeader(context),
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            _buildPricingCard(context.read<SellPropertyBloc>()),
                            const SizedBox(height: 20),
                            _buildAdditionalDetailsCard(context, context.read<SellPropertyBloc>()),
                            const SizedBox(height: 20),
                            _buildAmenitiesCard(
                              context.read<SellPropertyBloc>(),
                            ),
                            const SizedBox(height: 18),
                            _buildBottomButtons(
                                context.read<SellPropertyBloc>(), context),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
  }
}
