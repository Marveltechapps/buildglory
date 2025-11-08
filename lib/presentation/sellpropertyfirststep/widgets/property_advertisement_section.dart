import 'package:flutter/material.dart';

class PropertyAdvertisementSection extends StatelessWidget {
  final String selectedType;
  final Function(String) onTypeChanged;

  const PropertyAdvertisementSection({
    Key? key,
    required this.selectedType,
    required this.onTypeChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
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
            'Property Advertisement *',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xFF0A0A0A),
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              GestureDetector(
                onTap: () => onTypeChanged('Sale'),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: selectedType == 'Sale'
                        ? const Color(0xFF030213)
                        : Colors.white,
                    border: selectedType != 'Sale'
                        ? Border.all(color: const Color(0x1A000000))
                        : null,
                  ),
                  child: Text(
                    'Sale',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: selectedType == 'Sale'
                          ? Colors.white
                          : const Color(0xFF0A0A0A),
                      height: 1.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () => onTypeChanged('Rent/Lease'),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: selectedType == 'Rent/Lease'
                        ? const Color(0xFF030213)
                        : Colors.white,
                    border: selectedType != 'Rent/Lease'
                        ? Border.all(color: const Color(0x1A000000))
                        : null,
                  ),
                  child: Text(
                    'Rent/Lease',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: selectedType == 'Rent/Lease'
                          ? Colors.white
                          : const Color(0xFF0A0A0A),
                      height: 1.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
