import 'package:flutter/material.dart';
import 'form_card.dart';

class PropertyTypeCard extends StatelessWidget {
  final String selectedType;
  final Function(String) onTypeChanged;

  const PropertyTypeCard({
    Key? key,
    required this.selectedType,
    required this.onTypeChanged,
  }) : super(key: key);

  Widget _buildPropertyTypeButton({
    required String type,
    required String iconUrl,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isSelected ? const Color(0xFF030213) : Colors.white,
          border: Border.all(
            color: isSelected ? Colors.transparent : const Color(0x1A000000),
            width: 1,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          children: [
            Image.network(
              iconUrl,
              width: 14,
              height: 14,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 4),
            Text(
              type,
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: isSelected ? Colors.white : const Color(0xFF1A1A1A),
                height: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FormCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Property Type *',
            style: TextStyle(
              fontFamily: 'Arial',
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Color(0xFF1A1A1A),
              height: 1.4,
            ),
          ),
          const SizedBox(height: 14),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildPropertyTypeButton(
                    type: 'Apartment',
                    iconUrl: 'https://api.builder.io/api/v1/image/assets/3eed9e34f3904b5687afb7d840d6be68/f415a200c257514f5207f16993d81423f5a865ea?placeholderIfAbsent=true',
                    isSelected: selectedType == 'Apartment',
                    onTap: () => onTypeChanged('Apartment'),
                  ),
                  _buildPropertyTypeButton(
                    type: 'Independent House',
                    iconUrl: 'https://api.builder.io/api/v1/image/assets/3eed9e34f3904b5687afb7d840d6be68/521d70ac57592970a8d4b9144477156e330f7c56?placeholderIfAbsent=true',
                    isSelected: selectedType == 'Independent House',
                    onTap: () => onTypeChanged('Independent House'),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildPropertyTypeButton(
                    type: 'Villa',
                    iconUrl: 'https://api.builder.io/api/v1/image/assets/3eed9e34f3904b5687afb7d840d6be68/521d70ac57592970a8d4b9144477156e330f7c56?placeholderIfAbsent=true',
                    isSelected: selectedType == 'Villa',
                    onTap: () => onTypeChanged('Villa'),
                  ),
                  _buildPropertyTypeButton(
                    type: 'Plot/Land',
                    iconUrl: 'https://api.builder.io/api/v1/image/assets/3eed9e34f3904b5687afb7d840d6be68/ac8fa318c132974634c692d47ecd404ccf3a3043?placeholderIfAbsent=true',
                    isSelected: selectedType == 'Plot/Land',
                    onTap: () => onTypeChanged('Plot/Land'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
