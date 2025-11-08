import 'package:flutter/material.dart';

class PropertyTypeSection extends StatelessWidget {
  final String selectedType;
  final Function(String) onTypeChanged;

  const PropertyTypeSection({
    Key? key,
    required this.selectedType,
    required this.onTypeChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Property Type *',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xFF0A0A0A),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    _buildPropertyTypeButton(
                      'Apartment',
                      Icon(Icons.home),
                      selectedType == 'Apartment',
                      () => onTypeChanged('Apartment'),
                    ),
                    const SizedBox(height: 8),
                    _buildPropertyTypeButton(
                      'Villa',
                      Icon(Icons.home),
                      selectedType == 'Villa',
                      () => onTypeChanged('Villa'),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  children: [
                    _buildPropertyTypeButton(
                      'Independent House',
                      Icon(Icons.home),
                      selectedType == 'Independent House',
                      () => onTypeChanged('Independent House'),
                    ),
                    const SizedBox(height: 8),
                    _buildPropertyTypeButton(
                      'Plot/Land',
                      Icon(Icons.home),
                      selectedType == 'Plot/Land',
                      () => onTypeChanged('Plot/Land'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPropertyTypeButton(
    String title,
    Icon icon,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 151,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: isSelected ? const Color(0xFF030213) : Colors.white,
          border: !isSelected
              ? Border.all(color: const Color(0x1A000000))
              : null,
        ),
        child: Column(
          children: [
            icon,
            const SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: isSelected ? Colors.white : const Color(0xFF0A0A0A),
                height: 1.0,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
