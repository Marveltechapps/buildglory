import 'package:buildglory/constant/constant.dart';
import 'package:buildglory/new/presentation/profile/widgets/custom_input_field.dart';
import 'package:buildglory/screens/residential/models/property.dart';
import 'package:buildglory/screens/residential/detail/residential_detail_screen.dart';
import 'package:buildglory/screens/residential/residentiallist/filter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ResidentialListScreen extends StatelessWidget {
  final String? title;
  final String colorcode;

  const ResidentialListScreen({super.key, this.title, required this.colorcode});

  static TextEditingController searchController = TextEditingController();
  static bool isfilter = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title ?? "",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1A1A1A),
                    letterSpacing: -0.35,
                    height: 1.4,
                    fontFamily: 'Arial',
                  ),
                ),
                Text(
                  '8 properties available',
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
            InkWell(
              onTap: () {
                // setState(() {
                //   isfilter = !isfilter;
                // });
              },
              child: SvgPicture.asset(filterIcon),
            ),
          ],
        ) /* ListTile(
          title: Text(
            title,
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
            '8 properties available',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xFF6A7282),
              height: 1,
              fontFamily: 'Arial',
            ),
          ),
          trailing: InkWell(onTap: () {}, child: SvgPicture.asset(filterIcon)),
        ), */,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: CustomInputField(
              label: '',
              placeholder: 'Search by residentional properties',
              prefixIcon: true,
              controller: searchController,
              prefix: SvgPicture.asset(searchgreyIcon),
            ),
          ),
          if (isfilter)
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: PropertyFilterButtons(),
            ),
          // Content area
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const SizedBox(height: 4),
                  // Property card
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: const Offset(0, 1),
                          blurRadius: 3,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        // Property image with overlays
                        SizedBox(
                          width: double.infinity,
                          height: 200,
                          child: Stack(
                            children: [
                              // Background image
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
                              // Overlays
                              Positioned(
                                top: 10,
                                left: 10,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // For Sale badge
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          16777200,
                                        ),
                                        color: Color(int.parse(colorcode)),
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
                                    const SizedBox(height: 10),
                                    // Heart button
                                    Container(
                                      width: 32,
                                      height: 32,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          16777200,
                                        ),
                                        color: Colors.white.withOpacity(0.9),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(
                                              0.1,
                                            ),
                                            offset: const Offset(0, 1),
                                            blurRadius: 3,
                                          ),
                                        ],
                                      ),
                                      child: Center(
                                        child: SvgPicture.asset(
                                          heartgreyIcon,
                                          width: 14,
                                          height: 14,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    // Rating badge
                                    Container(
                                      height: 21,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          16777200,
                                        ),
                                        color: Colors.white.withOpacity(0.9),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 7,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SvgPicture.asset(
                                            stargoldIcon,
                                            width: 10,
                                            height: 10,
                                          ),
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
                        ),
                        // Property details
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              // Price and type
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                  // Villa badge
                                  Container(
                                    height: 22,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      border: Border.all(
                                        color: const Color(0xFFE5E7EB),
                                        width: 1,
                                      ),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 7,
                                      vertical: 3,
                                    ),
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
                              // Location
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    locationgreyIcon,
                                    width: 18,
                                    height: 17,
                                  ),
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
                              // Property features
                              Row(
                                children: [
                                  // Bed
                                  Expanded(
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          bedIcon,
                                          width: 18,
                                          height: 18,
                                        ),
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
                                  // Bath
                                  Expanded(
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          bathIcon,
                                          width: 18,
                                          height: 18,
                                        ),
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
                                  // Area
                                  Expanded(
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          squarefeetIcon,
                                          width: 17,
                                          height: 18,
                                        ),
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
                              // Bottom section with "By" and "View Details" button
                              Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                      color: Color(0xFFF3F4F6),
                                      width: 1,
                                    ),
                                  ),
                                ),
                                padding: const EdgeInsets.only(top: 12),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: const Text(
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
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //     builder: (context) {
                                          //       return /* title == "Plots"
                                          //           ? PlotDetailsScreen()
                                          //           :  */ ResidentialDetailScreen(
                                          //         property: Property(
                                          //           id: "1",
                                          //           imageUrl:
                                          //               "https://api.builder.io/api/v1/image/assets/3eed9e34f3904b5687afb7d840d6be68/92a95dbf320201a31d4fc9e31046a7fb818c0344?placeholderIfAbsent=true",
                                          //           status: "For Sale",
                                          //           price: "₹ 1.2 Cores",
                                          //           name:
                                          //               "Phoenix Meadows Villa",
                                          //           type: "Villa",
                                          //           location:
                                          //               "OMR (IT Corridor), Chennai",
                                          //           bedrooms: 4,
                                          //           bathrooms: 3,
                                          //           sqft: 2850,
                                          //           description:
                                          //               "Luxurious villa with modern amenities, spacious rooms, and premium finishes. Located in a gated community with excellent facilities.",
                                          //           builtYear: "2018",
                                          //           features: [],
                                          //         ),
                                          //         colorcode: colorcode,
                                          //         title: title ?? "",
                                          //       );
                                          //     },
                                          //   ),
                                          // );
                                        },
                                        child: Container(
                                          height: 40,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              16777200,
                                            ),
                                            color: Color(int.parse(colorcode)),
                                          ),
                                          child: const Center(
                                            child: Text(
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
