import 'package:flutter/material.dart';
import 'form_card.dart';
import 'custom_dropdown.dart';
import 'custom_input.dart';

class LocationDetailsCard extends StatelessWidget {
  final String selectedCity;
  final String locality;
  final String projectName;
  final Function(String) onCityChanged;
  final Function(String) onLocalityChanged;
  final Function(String) onProjectNameChanged;

  const LocationDetailsCard({
    Key? key,
    required this.selectedCity,
    required this.locality,
    required this.projectName,
    required this.onCityChanged,
    required this.onLocalityChanged,
    required this.onProjectNameChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Location Details *',
            style: TextStyle(
              fontFamily: 'Arial',
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Color(0xFF1A1A1A),
              height: 1.4,
            ),
          ),
          const SizedBox(height: 12),
          CustomDropdown(
            label: 'City *',
            value: selectedCity,
            options: ['Chennai', 'Mumbai', 'Delhi', 'Bangalore', 'Hyderabad'],
            onChanged: onCityChanged,
          ),
          const SizedBox(height: 12),
          CustomInput(
            label: 'Locality *',
            value: locality,
            onChanged: onLocalityChanged,
          ),
          const SizedBox(height: 12),
          CustomInput(
            label: 'Project/Society Name',
            value: projectName,
            onChanged: onProjectNameChanged,
          ),
        ],
      ),
    );
  }
}
