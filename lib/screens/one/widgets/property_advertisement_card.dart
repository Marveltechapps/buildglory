import 'package:flutter/material.dart';
import 'form_card.dart';
import 'custom_button.dart';

class PropertyAdvertisementCard extends StatelessWidget {
  final String selectedType;
  final Function(String) onTypeChanged;

  const PropertyAdvertisementCard({
    Key? key,
    required this.selectedType,
    required this.onTypeChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Property Advertisement *',
            style: TextStyle(
              fontFamily: 'Arial',
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Color(0xFF1A1A1A),
              height: 1.4,
            ),
          ),
          const SizedBox(height: 14),
          Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: CustomButton(
                  text: 'Sale',
                  onPressed: () => onTypeChanged('Sale'),
                  backgroundColor: selectedType == 'Sale'
                      ? const Color(0xFF030213)
                      : Colors.white,
                  textColor: selectedType == 'Sale'
                      ? Colors.white
                      : const Color(0xFF1A1A1A),
                  borderColor: selectedType == 'Sale'
                      ? null
                      : const Color(0x1A000000),
                  fontSize: 14,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: CustomButton(
                  text: 'Rent/Lease',
                  onPressed: () => onTypeChanged('Rent/Lease'),
                  backgroundColor: selectedType == 'Rent/Lease'
                      ? const Color(0xFF030213)
                      : Colors.white,
                  textColor: selectedType == 'Rent/Lease'
                      ? Colors.white
                      : const Color(0xFF1A1A1A),
                  borderColor: selectedType == 'Rent/Lease'
                      ? null
                      : const Color(0x1A000000),
                  fontSize: 14,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
