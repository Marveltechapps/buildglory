import 'package:buildglory/final/home/widgets/feature_card.dart';
import 'package:buildglory/final/home/widgets/property_recommendation_card.dart';
import 'package:buildglory/final/home/widgets/property_type_card.dart';
import 'package:buildglory/final/home/widgets/search_bar_widget.dart';
import 'package:buildglory/final/home/widgets/statistic_item.dart';
import 'package:buildglory/final/propertylist/pages/property_list_screen.dart';
import 'package:buildglory/screens/locations/location_search_screen.dart';
import 'package:buildglory/screens/organichomes/organic_homes_screen.dart';

import 'package:flutter/material.dart';

class PropertyHomeScreen extends StatelessWidget {
  const PropertyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Main content container
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Search section
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LocationSearchPage();
                        },
                      ),
                    );
                  },
                  child: SizedBox(child: SearchBarWidget()),
                ),
              ),

              const SizedBox(height: 14),

              // Hero image
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 25,
                      offset: const Offset(0, 20),
                      spreadRadius: -5,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: AspectRatio(
                    aspectRatio: 2.03,
                    child: Image.network(
                      "https://builtglory.s3.ap-south-1.amazonaws.com/New+Version+0.1/Builtglory+AI/Banner.png",
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[300],
                          child: const Icon(Icons.image, size: 50),
                        );
                      },
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 14),

              // Quick Explore section
              Container(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Quick Explore',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF101828),
                        letterSpacing: -0.16,
                        height: 2,
                        fontFamily: 'Arial',
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Property type cards
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return PropertyListScreen(
                                    title: "Apartment",
                                    type: "Buy",
                                    colorcode: "0xFF155DFC",
                                  );
                                },
                              ),
                            );
                          },
                          child: PropertyTypeCard(
                            title: 'Apartments',
                            subtitle: '1,200+ listings available',
                            description: 'Modern residential complexes',
                            imageUrl:
                                'https://api.builder.io/api/v1/image/assets/3eed9e34f3904b5687afb7d840d6be68/d69b5a643eda84b94816ab587bbc2a2fc42d2d92?placeholderIfAbsent=true',
                            backgroundColor: const Color(0xFFEFF6FF),
                            borderColor: const Color(0xFFBEDBFF),
                            buttonColor: const Color(0xFF155DFC),
                          ),
                        ),

                        const SizedBox(height: 11),

                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return PropertyListScreen(
                                    title: "Villa",
                                    type: "Buy",
                                    colorcode: "0xFF9810FA",
                                  );
                                },
                              ),
                            );
                          },
                          child: PropertyTypeCard(
                            title: 'Villas',
                            subtitle: '800+ listings available',
                            description: 'Luxury independent houses',
                            imageUrl:
                                'https://api.builder.io/api/v1/image/assets/3eed9e34f3904b5687afb7d840d6be68/53e443b48a73ee0c2c41f4c9476b9f0bc46686a7?placeholderIfAbsent=true',
                            backgroundColor: const Color(0xFFF0FDF4),
                            borderColor: const Color(0xFFB9F8CF),
                            buttonColor: const Color(0xFF00A63E),
                          ),
                        ),

                        const SizedBox(height: 11),

                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return PropertyListScreen(
                                    title: "Commercial",
                                    type: "Buy",
                                    colorcode: "0xFF155DFC",
                                  );
                                },
                              ),
                            );
                          },
                          child: PropertyTypeCard(
                            title: 'Commercial',
                            subtitle: '3+ listings available',
                            description: 'Office spaces & retail',
                            imageUrl:
                                'https://api.builder.io/api/v1/image/assets/3eed9e34f3904b5687afb7d840d6be68/f9637687f7bcf10d0afcdacdebb13d9f2e48d90d?placeholderIfAbsent=true',
                            backgroundColor: const Color(0xFFFAF5FF),
                            borderColor: const Color(0xFFE9D4FF),
                            buttonColor: const Color(0xFF9810FA),
                          ),
                        ),

                        const SizedBox(height: 11),

                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return PropertyListScreen(
                                    title: "Plot",
                                    type: "Buy",
                                    colorcode: "0xFF00A63E",
                                  );
                                },
                              ),
                            );
                          },
                          child: PropertyTypeCard(
                            title: 'Plots',
                            subtitle: '4+ listings available',
                            description: 'Residential & commercial land',
                            imageUrl:
                                'https://api.builder.io/api/v1/image/assets/3eed9e34f3904b5687afb7d840d6be68/45374dbc1936a11fbfed0690ce1194a03feb7c0e?placeholderIfAbsent=true',
                            backgroundColor: const Color(0xFFFFF7ED),
                            borderColor: const Color(0xFFFFD6A7),
                            buttonColor: const Color(0xFFF54900),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 14),

              // Recommended for You section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Recommended for You',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF101828),
                      letterSpacing: -0.16,
                      height: 2,
                      fontFamily: 'Arial',
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Horizontal scrollable recommendations
                  SizedBox(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        PropertyCard(
                          propertyName: 'Phoenix Meadows Villa',
                          location: 'OMR (IT Corridor), Chennai',
                          price: '₹1.2 Crores',
                          bedrooms: '4 BR',
                          area: '2850 sqft',
                          availability: 'Available',
                          propertyImage:
                              'https://api.builder.io/api/v1/image/assets/3eed9e34f3904b5687afb7d840d6be68/57cc9c68a57b7e82a6bcf7d4688e7e9953378485?placeholderIfAbsent=true',
                          // showFullDetails: true,
                        ),
                        SizedBox(width: 16),
                        PropertyCard(
                          propertyName: 'Phoenix Meadows Villa',
                          location: 'OMR (IT Corridor), Chennai',
                          price: '₹1.2 Crores',
                          bedrooms: '4 BR',
                          area: '2850 sqft',
                          availability: 'Available',
                          propertyImage:
                              'https://api.builder.io/api/v1/image/assets/3eed9e34f3904b5687afb7d840d6be68/57cc9c68a57b7e82a6bcf7d4688e7e9953378485?placeholderIfAbsent=true',
                          // showFullDetails: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              // Organic Homes section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Organic Homes',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF101828),
                      letterSpacing: -0.16,
                      height: 2,
                      fontFamily: 'Arial',
                    ),
                  ),

                  const SizedBox(height: 12),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xFFECFDF5),
                      border: Border.all(color: const Color(0xFFA4F4CF)),
                    ),
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 42,
                              height: 42,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: const Color(0xFFD0FAE5),
                              ),
                              child: Center(
                                child: Image.network(
                                  'https://api.builder.io/api/v1/image/assets/3eed9e34f3904b5687afb7d840d6be68/0e65c54a620399b29d4ed94cab60c70cf86c61d6?placeholderIfAbsent=true',
                                  width: 21,
                                  height: 21,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Icon(
                                      Icons.eco,
                                      size: 21,
                                      color: Colors.green,
                                    );
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Eco-Friendly Properties',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF101828),
                                      fontFamily: 'Arial',
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Sustainable living solutions',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF4A5565),
                                      fontFamily: 'Arial',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 14),

                        const Text(
                          'Discover homes built with sustainable materials and energy-efficient designs.',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF4A5565),
                            height: 1.27,
                            fontFamily: 'Arial',
                          ),
                        ),

                        const SizedBox(height: 14),

                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return OrganicHomesScreen();
                                },
                              ),
                            );
                          },
                          child: Container(
                            height: 32,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xFF009966),
                            ),
                            child: Center(
                              child: const Text(
                                'Explore Organic Homes',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  fontFamily: 'Arial',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              // Why Choose Built Glory section
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(21),
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFFF3F4F6)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 3,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // Header
                    const Column(
                      children: [
                        Text(
                          'Why Choose Built Glory?',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF101828),
                            height: 2,
                            fontFamily: 'Arial',
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 7),
                        Text(
                          'Your trusted property buying partner',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF6A7282),
                            fontFamily: 'Arial',
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Feature cards
                    Column(
                      children: [
                        FeatureCard(
                          title: '100% Verified Properties',
                          description:
                              'Every property verified for legal clearance and authenticity',
                          iconUrl:
                              'https://api.builder.io/api/v1/image/assets/3eed9e34f3904b5687afb7d840d6be68/6af8fdf2acd014324d2249f7e6e682e8b6c59e9d?placeholderIfAbsent=true',
                          backgroundColor: const Color(0xFFF0FDF4),
                          borderColor: const Color(0xFFDCFCE7),
                          iconBackgroundColor: const Color(0xFF00C950),
                        ),

                        const SizedBox(height: 12),

                        FeatureCard(
                          title: 'Smart Property Matching',
                          description:
                              'AI-powered recommendations based on your preferences',
                          iconUrl:
                              'https://api.builder.io/api/v1/image/assets/3eed9e34f3904b5687afb7d840d6be68/84c76e84635e158934f4220ab3d92e174d3b2b3e?placeholderIfAbsent=true',
                          backgroundColor: const Color(0xFFEFF6FF),
                          borderColor: const Color(0xFFDBEAFE),
                          iconBackgroundColor: const Color(0xFF2B7FFF),
                        ),

                        const SizedBox(height: 12),

                        FeatureCard(
                          title: 'Expert Buying Support',
                          description:
                              'Dedicated assistance from search to final registration',
                          iconUrl:
                              'https://api.builder.io/api/v1/image/assets/3eed9e34f3904b5687afb7d840d6be68/27548e300a89afe106c68d2981c70d5f0115be63?placeholderIfAbsent=true',
                          backgroundColor: const Color(0xFFFAF5FF),
                          borderColor: const Color(0xFFF3E8FF),
                          iconBackgroundColor: const Color(0xFFAD46FF),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // Statistics section
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Color(0xFFF3F4F6)),
                        ),
                      ),
                      padding: const EdgeInsets.only(top: 20),
                      child: const Row(
                        children: [
                          Expanded(
                            child: StatisticItem(
                              value: '8000+',
                              label: 'Happy Buyers',
                            ),
                          ),
                          SizedBox(
                            width: 1,
                            height: 28,
                            child: ColoredBox(color: Color(0xFFE5E7EB)),
                          ),
                          Expanded(
                            child: StatisticItem(
                              value: '95%',
                              label: 'Satisfaction Rate',
                            ),
                          ),
                          SizedBox(
                            width: 1,
                            height: 28,
                            child: ColoredBox(color: Color(0xFFE5E7EB)),
                          ),
                          Expanded(
                            child: StatisticItem(
                              value: '4.8★',
                              label: 'User Rating',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 14),

              // Help/Chat section
              Center(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xFF155DFC),
                    border: Border.all(color: Colors.black.withOpacity(0.1)),
                  ),
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    children: [
                      const Column(
                        children: [
                          Text(
                            'Need Help?',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              height: 1.4,
                              fontFamily: 'Arial',
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 7),
                          Text(
                            'Our experts are here to assist you',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFDBEAFE),
                              fontFamily: 'Arial',
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),

                      const SizedBox(height: 14),

                      Container(
                        height: 32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white.withOpacity(0.2),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 3,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.network(
                              'https://api.builder.io/api/v1/image/assets/3eed9e34f3904b5687afb7d840d6be68/c7e484f7eccbfd2e0604c38874f92e7a1da6e101?placeholderIfAbsent=true',
                              width: 14,
                              height: 14,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(
                                  Icons.chat,
                                  size: 14,
                                  color: Colors.white,
                                );
                              },
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Chat',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                fontFamily: 'Arial',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
