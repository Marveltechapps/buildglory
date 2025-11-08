import 'package:buildglory/constant/constant.dart';
import 'package:buildglory/final/sell/bloc/sell_property_bloc.dart';
import 'package:buildglory/final/sell/bloc/sell_property_event.dart';
import 'package:buildglory/final/sell/bloc/sell_property_state.dart';
import 'package:buildglory/new/presentation/profile/widgets/custom_input_field.dart';
import 'package:buildglory/screens/widgets/sell_property_two.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SellPropertyOneScreen extends StatelessWidget {
  const SellPropertyOneScreen({super.key});

  static TextEditingController builtUpAreaController = TextEditingController();
  static TextEditingController carpetAreaController = TextEditingController();
  static TextEditingController localityController = TextEditingController();
  static TextEditingController projectController = TextEditingController();
  static TextEditingController cityController = TextEditingController();
  static TextEditingController bhktypeController = TextEditingController();

  Widget _buildPropertyTypeButton(
    String label,
    String iconUrl,
    bool isSelected,
    SellPropertyBloc sellpropertybloc,
  ) {
    return GestureDetector(
      onTap: () {
        sellpropertybloc.add(
          SelectOptionsEvent(title: "Property Type", selectedValue: label),
        );
        // setState(() {
        //   selectedPropertyType = label;
        // });
      },
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isSelected ? const Color(0xFF030213) : Colors.white,
          border: !isSelected
              ? Border.all(color: const Color(0x1A000000), width: 1)
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconUrl,
              width: 14,
              height: 14,
              fit: BoxFit.contain,

              color: isSelected ? Colors.white : const Color(0xFF1A1A1A),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                color: isSelected ? Colors.white : const Color(0xFF1A1A1A),
                height: 1,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SellPropertyBloc(),
      child: BlocConsumer<SellPropertyBloc, SellPropertyState>(
        listener: (context, state) {
          if (state is SelectedOptionSuccessState) {
            if (state.title == "Property Advertisement") {
              context.read<SellPropertyBloc>().selectedAdvertisementType =
                  state.selectedValue;
            } else if (state.title == "Property Type") {
              context.read<SellPropertyBloc>().selectedPropertyType =
                  state.selectedValue;
            } else if (state.title == "BHK Type *") {
              context.read<SellPropertyBloc>().selectedBhkType =
                  state.selectedValue;
              bhktypeController.text = state.selectedValue;
            } else {
              context.read<SellPropertyBloc>().selectedCity =
                  state.selectedValue;
              cityController.text = state.selectedValue;
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
                    // Header Section
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xFFF3F4F6),
                            width: 1,
                          ),
                        ),
                      ),
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header with back button and title
                          SizedBox(
                            height: 42,
                            child: Row(
                              children: [
                                Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      33554400,
                                    ),
                                  ),
                                  child: Center(
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(Icons.arrow_back),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Property Details',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF1A1A1A),
                                          letterSpacing: -0.35,
                                          height: 1.4,
                                        ),
                                      ),
                                      const Text(
                                        'Step 1 of 4',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Color(0xFF4A5565),
                                          height: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Progress bar
                          Container(
                            height: 7,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(33554400),
                              color: const Color(0xFFE5E7EB),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        33554400,
                                      ),
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
                    ),
                    // Form Content
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            // Property Advertisement Card
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,
                                border: Border.all(
                                  color: const Color(0x1A000000),
                                  width: 1,
                                ),
                              ),
                              padding: const EdgeInsets.fromLTRB(
                                16,
                                15,
                                16,
                                15,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Property Advertisement *',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xFF1A1A1A),
                                      height: 1.4,
                                    ),
                                  ),
                                  const SizedBox(height: 14),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            context.read<SellPropertyBloc>().add(
                                              SelectOptionsEvent(
                                                title: "Property Advertisement",
                                                selectedValue: "Sale",
                                              ),
                                            );
                                            // setState(() {
                                            //   selectedAdvertisementType = 'Sale';
                                            // });
                                          },
                                          child: Container(
                                            height: 40,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color:
                                                  context
                                                          .read<
                                                            SellPropertyBloc
                                                          >()
                                                          .selectedAdvertisementType ==
                                                      'Sale'
                                                  ? const Color(0xFF030213)
                                                  : Colors.white,
                                              border:
                                                  context
                                                          .read<
                                                            SellPropertyBloc
                                                          >()
                                                          .selectedAdvertisementType !=
                                                      'Sale'
                                                  ? Border.all(
                                                      color: const Color(
                                                        0x1A000000,
                                                      ),
                                                      width: 1,
                                                    )
                                                  : null,
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Sale',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color:
                                                      context
                                                              .read<
                                                                SellPropertyBloc
                                                              >()
                                                              .selectedAdvertisementType ==
                                                          'Sale'
                                                      ? Colors.white
                                                      : const Color(0xFF1A1A1A),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            context.read<SellPropertyBloc>().add(
                                              SelectOptionsEvent(
                                                title: "Property Advertisement",
                                                selectedValue: "Rent/Lease",
                                              ),
                                            );
                                            // setState(() {
                                            //   selectedAdvertisementType =
                                            //       'Rent/Lease';
                                            // });
                                          },
                                          child: Container(
                                            height: 40,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color:
                                                  context
                                                          .read<
                                                            SellPropertyBloc
                                                          >()
                                                          .selectedAdvertisementType ==
                                                      'Rent/Lease'
                                                  ? const Color(0xFF030213)
                                                  : Colors.white,
                                              border:
                                                  context
                                                          .read<
                                                            SellPropertyBloc
                                                          >()
                                                          .selectedAdvertisementType !=
                                                      'Rent/Lease'
                                                  ? Border.all(
                                                      color: const Color(
                                                        0x1A000000,
                                                      ),
                                                      width: 1,
                                                    )
                                                  : null,
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Rent/Lease',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color:
                                                      context
                                                              .read<
                                                                SellPropertyBloc
                                                              >()
                                                              .selectedAdvertisementType ==
                                                          'Rent/Lease'
                                                      ? Colors.white
                                                      : const Color(0xFF1A1A1A),
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
                            const SizedBox(height: 21),
                            // Property Type Card
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,
                                border: Border.all(
                                  color: const Color(0x1A000000),
                                  width: 1,
                                ),
                              ),
                              padding: const EdgeInsets.fromLTRB(
                                16,
                                16,
                                16,
                                10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Property Type *',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xFF1A1A1A),
                                      height: 1.4,
                                    ),
                                  ),
                                  const SizedBox(height: 14),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: _buildPropertyTypeButton(
                                              'Apartment',
                                              apartmentwhiteIcon,
                                              context
                                                      .read<SellPropertyBloc>()
                                                      .selectedPropertyType ==
                                                  'Apartment',
                                              context.read<SellPropertyBloc>(),
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: _buildPropertyTypeButton(
                                              'Independent House',
                                              homewhiteIcon,
                                              context
                                                      .read<SellPropertyBloc>()
                                                      .selectedPropertyType ==
                                                  'Independent House',
                                              context.read<SellPropertyBloc>(),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 14),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: _buildPropertyTypeButton(
                                              'Villa',
                                              homeblackIcon,
                                              context
                                                      .read<SellPropertyBloc>()
                                                      .selectedPropertyType ==
                                                  'Villa',
                                              context.read<SellPropertyBloc>(),
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: _buildPropertyTypeButton(
                                              'Plot/Land',
                                              locationblackIcon,
                                              context
                                                      .read<SellPropertyBloc>()
                                                      .selectedPropertyType ==
                                                  'Plot/Land',
                                              context.read<SellPropertyBloc>(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 21),
                            // Property Configuration Card
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,
                                border: Border.all(
                                  color: const Color(0x1A000000),
                                  width: 1,
                                ),
                              ),
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Property Configuration',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xFF1A1A1A),
                                      height: 1.4,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  // BHK Type Dropdown
                                  CustomInputField(
                                    label: 'BHK Type *',
                                    placeholder: '- SELECT -',
                                    readonly: true,
                                    controller: bhktypeController,
                                    sellPropertyBloc: context
                                        .read<SellPropertyBloc>(),
                                  ),
                                  const SizedBox(height: 14),
                                  // Area inputs
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CustomInputField(
                                          label: 'Build Up Area',
                                          placeholder: '1000 sq ft',
                                          controller: builtUpAreaController,
                                          sellPropertyBloc: context
                                              .read<SellPropertyBloc>(),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: CustomInputField(
                                          label: 'Carpet Area',
                                          placeholder: '1000 sq ft',
                                          controller: carpetAreaController,
                                          sellPropertyBloc: context
                                              .read<SellPropertyBloc>(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 21),
                            // Location Details Card
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,
                                border: Border.all(
                                  color: const Color(0x1A000000),
                                  width: 1,
                                ),
                              ),
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Location Details *',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xFF1A1A1A),
                                      height: 1.4,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  // City Dropdown
                                  CustomInputField(
                                    label: 'City *',
                                    placeholder: '- SELECT -',
                                    readonly: true,
                                    controller: cityController,
                                    sellPropertyBloc: context
                                        .read<SellPropertyBloc>(),
                                  ),
                                  const SizedBox(height: 12),
                                  // Locality Input
                                  CustomInputField(
                                    label: 'Locality *',
                                    placeholder: '',
                                    controller: localityController,
                                    sellPropertyBloc: context
                                        .read<SellPropertyBloc>(),
                                  ),
                                  const SizedBox(height: 12),
                                  // Project/Society Name Input
                                  CustomInputField(
                                    label: 'Project / Society Name',
                                    placeholder: '',
                                    controller: projectController,
                                    sellPropertyBloc: context
                                        .read<SellPropertyBloc>(),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            // Continue Button
                            SizedBox(
                              width: double.infinity,
                              height: 42,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return SellPropertyTwo();
                                      },
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF155DFC),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  elevation: 0,
                                ),
                                child: const Text(
                                  'Continue',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
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
          );
        },
      ),
    );
  }
}
