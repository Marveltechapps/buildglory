import 'package:flutter/material.dart';
import 'property_form_header.dart';
import 'property_advertisement_card.dart';
import 'property_type_card.dart';
import 'property_configuration_card.dart';
import 'location_details_card.dart';
import 'custom_button.dart';

class SellPropertyFormPage extends StatefulWidget {
  const SellPropertyFormPage({Key? key}) : super(key: key);

  @override
  State<SellPropertyFormPage> createState() => _SellPropertyFormPageState();
}

class _SellPropertyFormPageState extends State<SellPropertyFormPage> {
  String selectedAdvertisementType = 'Sale';
  String selectedPropertyType = 'Apartment';
  String selectedBHKType = '2 BHK';
  String selectedCity = 'Chennai';
  String builtUpArea = '1000';
  String carpetArea = '1000';
  String locality = 'asda';
  String projectName = 'asd';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 480),
          width: double.infinity,
          child: Column(
            children: [
              PropertyFormHeader(
                onBackPressed: () => Navigator.of(context).pop(),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      PropertyAdvertisementCard(
                        selectedType: selectedAdvertisementType,
                        onTypeChanged: (type) {
                          setState(() {
                            selectedAdvertisementType = type;
                          });
                        },
                      ),
                      const SizedBox(height: 21),
                      PropertyTypeCard(
                        selectedType: selectedPropertyType,
                        onTypeChanged: (type) {
                          setState(() {
                            selectedPropertyType = type;
                          });
                        },
                      ),
                      const SizedBox(height: 21),
                      PropertyConfigurationCard(
                        selectedBHKType: selectedBHKType,
                        builtUpArea: builtUpArea,
                        carpetArea: carpetArea,
                        onBHKTypeChanged: (type) {
                          setState(() {
                            selectedBHKType = type;
                          });
                        },
                        onBuiltUpAreaChanged: (area) {
                          setState(() {
                            builtUpArea = area;
                          });
                        },
                        onCarpetAreaChanged: (area) {
                          setState(() {
                            carpetArea = area;
                          });
                        },
                      ),
                      const SizedBox(height: 21),
                      LocationDetailsCard(
                        selectedCity: selectedCity,
                        locality: locality,
                        projectName: projectName,
                        onCityChanged: (city) {
                          setState(() {
                            selectedCity = city;
                          });
                        },
                        onLocalityChanged: (value) {
                          setState(() {
                            locality = value;
                          });
                        },
                        onProjectNameChanged: (value) {
                          setState(() {
                            projectName = value;
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomButton(
                        text: 'Continue',
                        onPressed: () {
                          // Handle continue action
                        },
                        backgroundColor: const Color(0xFF155DFC),
                        textColor: Colors.white,
                        width: double.infinity,
                        height: 42,
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
}
