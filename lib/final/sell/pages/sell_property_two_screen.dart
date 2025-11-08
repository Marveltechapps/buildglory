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
                    // setState(() {
                    //   priceNegotiable = value ?? false;
                    // });
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

  Widget _buildAdditionalDetailsCard() {
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

          CustomInputField(
            label: 'Age of Construction',
            placeholder: 'Select age',
            readonly: true,
            controller: ageofconstructionController,
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: CustomInputField(
                  label: 'Facing',
                  placeholder: 'Select facing',
                  readonly: true,
                  controller: facingController,
                ),
              ),
              const SizedBox(width: 16),

              Expanded(
                child: CustomInputField(
                  label: 'Ownership',
                  placeholder: 'Select type',
                  readonly: true,
                  controller: ownershipController,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          CustomInputField(
            label: 'Furnished Status',
            placeholder: 'Select status',
            readonly: true,
            controller: furnishedstatusController,
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

  Widget _buildBottomButtons(context) {
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
                debugPrint("Continue");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SellPropertyThreeScreen();
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
    return BlocProvider(
      create: (context) => SellPropertyBloc(),
      child: BlocConsumer<SellPropertyBloc, SellPropertyState>(
        listener: (context, state) {
          if (state is SelectedOptionSuccessState) {
            if (state.title == "Amenities") {
              context.read<SellPropertyBloc>().amenitiesSelectedList.add(
                state.selectedValue,
              );
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
                            _buildAdditionalDetailsCard(),
                            const SizedBox(height: 20),
                            _buildAmenitiesCard(
                              context.read<SellPropertyBloc>(),
                            ),
                            const SizedBox(height: 18),
                            _buildBottomButtons(context),
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
