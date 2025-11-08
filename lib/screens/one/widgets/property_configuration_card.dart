import 'package:flutter/material.dart';
import 'form_card.dart';
import 'custom_dropdown.dart';
import 'custom_input.dart';

class PropertyConfigurationCard extends StatelessWidget {
  final String selectedBHKType;
  final String builtUpArea;
  final String carpetArea;
  final Function(String) onBHKTypeChanged;
  final Function(String) onBuiltUpAreaChanged;
  final Function(String) onCarpetAreaChanged;

  const PropertyConfigurationCard({
    Key? key,
    required this.selectedBHKType,
    required this.builtUpArea,
    required this.carpetArea,
    required this.onBHKTypeChanged,
    required this.onBuiltUpAreaChanged,
    required this.onCarpetAreaChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Property Configuration',
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
            label: 'BHK Type',
            value: selectedBHKType,
            options: ['1 BHK', '2 BHK', '3 BHK', '4 BHK', '5+ BHK'],
            onChanged: onBHKTypeChanged,
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: CustomInput(
                  label: 'Built Up Area',
                  value: builtUpArea,
                  suffix: 'sq ft',
                  keyboardType: TextInputType.number,
                  onChanged: onBuiltUpAreaChanged,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: CustomInput(
                  label: 'Carpet Area',
                  value: carpetArea,
                  suffix: 'sq ft',
                  keyboardType: TextInputType.number,
                  onChanged: onCarpetAreaChanged,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
