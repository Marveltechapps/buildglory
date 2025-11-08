import 'package:buildglory/constant/constant.dart';
import 'package:buildglory/final/home/pages/home_main_screen.dart';
import 'package:buildglory/new/presentation/home/pages/home_main_screen.dart';
import 'package:buildglory/screens/residential/detail/residential_detail_screen.dart';
import 'package:buildglory/screens/residential/models/property.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExchangeMatchedPropertyListScreen extends StatefulWidget {
  const ExchangeMatchedPropertyListScreen({super.key});

  @override
  State<ExchangeMatchedPropertyListScreen> createState() =>
      _ExchangeMatchedPropertyListScreenState();
}

class _ExchangeMatchedPropertyListScreenState
    extends State<ExchangeMatchedPropertyListScreen> {
  String selectedFilter = 'All (15)';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: ListTile(
          title: Text(
            'Matched Properties',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1A1A1A),
              letterSpacing: -0.35,
              height: 1.4,
              fontFamily: 'Arial',
            ),
          ),
          subtitle: Text(
            '15 properties match your exchange',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xFF6A7282),
              height: 1,
              fontFamily: 'Arial',
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: SvgPicture.asset(filterIcon),
          ),
        ],
      ),
      body: Container(
        //  constraints: const BoxConstraints(maxWidth: 377),
        decoration: const BoxDecoration(color: Color(0xFFF9FAFB)),
        child: Column(
          children: [
            // _buildHeader(),
            _buildSmartMatchingSection(),
            _buildPropertyCard(),
            _buildBrowseMoreButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Color(0xFFF3F4F6), width: 1)),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildHeaderTop(),
          const SizedBox(height: 12),
          _buildFilterButtons(),
        ],
      ),
    );
  }

  Widget _buildHeaderTop() {
    return SizedBox(
      height: 42,
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: Center(
              child: Image.network(
                'https://api.builder.io/api/v1/image/assets/3eed9e34f3904b5687afb7d840d6be68/2494cda384088419a9f640a0e551bc284ef9c193?placeholderIfAbsent=true',
                width: 14,
                height: 14,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Matched Properties',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1A1A1A),
                    letterSpacing: -0.35,
                    height: 1.4,
                    fontFamily: 'Arial',
                  ),
                ),
                const Text(
                  '15 properties match your exchange',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF6A7282),
                    height: 1,
                    fontFamily: 'Arial',
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: Center(
              child: Image.network(
                'https://api.builder.io/api/v1/image/assets/3eed9e34f3904b5687afb7d840d6be68/c7f18732e8ef7c6cd1d0afe3e449193582267be1?placeholderIfAbsent=true',
                width: 14,
                height: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButtons() {
    final filters = ['All (15)', 'Apartments (2)', 'Villas (2)', 'Plots (4)'];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: filters.map((filter) => _buildFilterButton(filter)).toList(),
      ),
    );
  }

  Widget _buildFilterButton(String text) {
    final isSelected = selectedFilter == text;

    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedFilter = text;
          });
        },
        child: Container(
          height: 28,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: isSelected ? const Color(0xFF030213) : Colors.white,
            border: isSelected
                ? null
                : Border.all(color: const Color(0x1A000000), width: 1),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: text == 'All (15)' ? 11 : 11,
            vertical: 4,
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: isSelected ? Colors.white : const Color(0xFF1A1A1A),
                fontFamily: 'Arial',
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSmartMatchingSection() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(color: Color(0xFF276AFF)),
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0x33FFFFFF),
            ),
            child: Center(
              child: SvgPicture.asset(tickwhiteIcon, width: 21, height: 21),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Smart Matching Active',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    height: 1.4,
                    fontFamily: 'Arial',
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'These properties are matched based on your 2BHK in Anna Nagar. All owners are open to exchange.',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    height: 1.5,
                    fontFamily: 'Arial',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPropertyCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0, 1),
              blurRadius: 3,
            ),
          ],
        ),
        child: Column(
          children: [_buildPropertyImage(), _buildPropertyDetails()],
        ),
      ),
    );
  }

  Widget _buildPropertyImage() {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Image.network(
              'https://api.builder.io/api/v1/image/assets/3eed9e34f3904b5687afb7d840d6be68/92a95dbf320201a31d4fc9e31046a7fb818c0344?placeholderIfAbsent=true',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16777200),
                        color: const Color(0xFF155DFC),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      child: const Text(
                        'For Sale',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontFamily: 'Arial',
                        ),
                      ),
                    ),
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16777200),
                        color: const Color(0xE6FFFFFF),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: const Offset(0, 1),
                            blurRadius: 3,
                          ),
                        ],
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          heartblackIcon,
                          width: 14,
                          height: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 21,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16777200),
                    color: const Color(0xE6FFFFFF),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(stargoldIcon, width: 10, height: 11),
                      const SizedBox(width: 4),
                      const Text(
                        '4.9',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF1A1A1A),
                          height: 1,
                          fontFamily: 'Arial',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPropertyDetails() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '₹1.2 Crores',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1A1A1A),
                        height: 1.4,
                        fontFamily: 'Arial',
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Phoenix Meadows Villa',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF4A5565),
                        height: 1,
                        fontFamily: 'Arial',
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                child: const Text(
                  'Villa',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF4A5565),
                    height: 1,
                    fontFamily: 'Arial',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              SvgPicture.asset(locationgreyIcon, width: 18, height: 18),
              const SizedBox(width: 4),
              const Expanded(
                child: Text(
                  'OMR (IT Corridor), Chennai',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF6A7282),
                    height: 1,
                    fontFamily: 'Arial',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    SvgPicture.asset(bedIcon, width: 18, height: 17),
                    const SizedBox(width: 4),
                    const Text(
                      '4 Bed',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF4A5565),
                        height: 1,
                        fontFamily: 'Arial',
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    SvgPicture.asset(bathIcon, width: 18, height: 17),
                    const SizedBox(width: 4),
                    const Text(
                      '3 Bath',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF4A5565),
                        height: 1,
                        fontFamily: 'Arial',
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    SvgPicture.asset(squarefeetIcon, width: 17, height: 17),
                    const SizedBox(width: 4),
                    const Text(
                      '2,850 sqft',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF4A5565),
                        height: 1,
                        fontFamily: 'Arial',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Color(0xFFF3F4F6), width: 1),
              ),
            ),
            padding: const EdgeInsets.only(top: 12),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'By',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF6A7282),
                      height: 1,
                      fontFamily: 'Arial',
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return /* title == "Plots"
                                                    ? PlotDetailsScreen()
                                                    : */ ResidentialDetailScreen(
                            property: Property(
                              id: "1",
                              imageUrl:
                                  "https://api.builder.io/api/v1/image/assets/3eed9e34f3904b5687afb7d840d6be68/92a95dbf320201a31d4fc9e31046a7fb818c0344?placeholderIfAbsent=true",
                              status: "For Sale",
                              price: "₹ 1.2 Cores",
                              name: "Phoenix Meadows Villa",
                              type: "Villa",
                              location: "OMR (IT Corridor), Chennai",
                              bedrooms: 4,
                              bathrooms: 3,
                              sqft: 2850,
                              description:
                                  "Luxurious villa with modern amenities, spacious rooms, and premium finishes. Located in a gated community with excellent facilities.",
                              builtYear: "2018",
                              features: [],
                            ),
                            colorcode: "0xFF155DFC",
                            properytype: "Exchange",
                            title: "Apartments Details",
                          );
                        },
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16777200),
                      color: const Color(0xFF155DFC),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 6,
                    ),
                    child: const Text(
                      'View Details',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontFamily: 'Arial',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBrowseMoreButton() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(20),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return HomeMainScreen();
              },
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF030213),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          elevation: 0,
        ),
        child: const Text(
          'Browse More Properties',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.white,
            height: 2,
            fontFamily: 'Arial',
          ),
        ),
      ),
    );
  }
}
