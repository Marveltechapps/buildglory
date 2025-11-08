import 'package:flutter/material.dart';
import '../widgets/custom_header.dart';
import '../widgets/property_card.dart';
import '../models/property.dart';

class ResidentialListPage extends StatelessWidget {
  const ResidentialListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sampleProperty = Property(
      id: '1',
      price: '₹1.2 Crores',
      name: 'Phoenix Meadows Villa',
      location: 'OMR (IT Corridor), Chennai',
      imageUrl: 'https://api.builder.io/api/v1/image/assets/f9d3014b66ec4ab0b700dbedbaba9803/0e68051912597f7f19716eb2a8314ca3223cbd8d?placeholderIfAbsent=true',
      propertyType: 'Villa',
      bedrooms: 4,
      bathrooms: 3,
      area: '2,850 sqft',
      rating: 4.3,
      status: 'For Sale',
      agent: 'Agent Name',
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 377),
          child: Column(
            children: [
              CustomHeader(
                title: 'Residential',
                subtitle: '8 properties available',
                onBackPressed: () {
                  Navigator.of(context).pop();
                },
                onMenuPressed: () {
                  // Handle menu action
                },
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: PropertyCard(
                    property: sampleProperty,
                    onViewDetails: () {
                      // Handle view details action
                    },
                    onFavorite: () {
                      // Handle favorite action
                    },
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
