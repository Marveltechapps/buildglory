import 'package:buildglory/presentation/sellpropertysecondstep/pages/sell_property_second_page.dart';
import 'package:flutter/material.dart';
import '../widgets/property_form_header.dart';
import '../widgets/property_advertisement_section.dart';
import '../widgets/property_type_section.dart';
import '../widgets/property_configuration_section.dart';
import '../widgets/location_details_section.dart';
import '../widgets/form_footer.dart';

class SellPropertyFirstPage extends StatefulWidget {
  const SellPropertyFirstPage({super.key});

  @override
  State<SellPropertyFirstPage> createState() => _SellPropertyFormPageState();
}

class _SellPropertyFormPageState extends State<SellPropertyFirstPage> {
  String selectedAdvertisementType = 'Sale';
  String selectedPropertyType = 'Apartment';
  String selectedBHKType = '2 BHK';
  String builtUpArea = '1200';
  String carpetArea = '1000';
  String selectedCity = 'Bangalore';
  String locality = 'thiruvalluvar nagar';
  String projectName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 480),
          child: Column(
            children: [
              PropertyFormHeader(
                title: 'Property Deta ils',
                subtitle: 'Step 1 of 4',
                progress: 0.25,
                onBackPressed: () => Navigator.pop(context),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      PropertyAdvertisementSection(
                        selectedType: selectedAdvertisementType,
                        onTypeChanged: (type) {
                          setState(() {
                            selectedAdvertisementType = type;
                          });
                        },
                      ),
                      const SizedBox(height: 16),
                      PropertyTypeSection(
                        selectedType: selectedPropertyType,
                        onTypeChanged: (type) {
                          setState(() {
                            selectedPropertyType = type;
                          });
                        },
                      ),
                      const SizedBox(height: 16),
                      PropertyConfigurationSection(
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
                      const SizedBox(height: 16),
                      LocationDetailsSection(
                        selectedCity: selectedCity,
                        locality: locality,
                        projectName: projectName,
                        onCityChanged: (city) {
                          setState(() {
                            selectedCity = city;
                          });
                        },
                        onLocalityChanged: (loc) {
                          setState(() {
                            locality = loc;
                          });
                        },
                        onProjectNameChanged: (name) {
                          setState(() {
                            projectName = name;
                          });
                        },
                      ),
                      const SizedBox(height: 18),
                    ],
                  ),
                ),
              ),
              FormFooter(
                onContinuePressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SellPropertySecondPage();
                      },
                    ),
                  );
                  // Handle continue action
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
