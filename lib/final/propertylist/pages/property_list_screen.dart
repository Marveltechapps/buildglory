import 'package:buildglory/constant/constant.dart';
import 'package:buildglory/generated/bloc/bloc_exports.dart';
import 'package:buildglory/generated/models/property.dart' as GeneratedProperty;
import 'package:buildglory/final/propertylist/widgets/filter_widget.dart';
import 'package:buildglory/new/presentation/profile/widgets/custom_input_field.dart';
import 'package:buildglory/screens/residential/models/property.dart';
import 'package:buildglory/screens/residential/detail/residential_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class PropertyListScreen extends StatefulWidget {
  final String title;
  final String type;
  final String colorcode;

  const PropertyListScreen({
    super.key,
    required this.title,
    required this.type,
    required this.colorcode,
  });

  @override
  State<PropertyListScreen> createState() => _PropertyListScreenState();
}

class _PropertyListScreenState extends State<PropertyListScreen> {
  final TextEditingController searchController = TextEditingController();
  bool isfilter = false;
  List<GeneratedProperty.Property> propertyList = [];

  String formatIndianAmount(num amount) {
    if (amount >= 10000000) {
      // 1 crore = 10,000,000
      double crore = amount / 10000000;
      return "${crore.toStringAsFixed(crore.truncateToDouble() == crore ? 0 : 2)} Cr";
    } else if (amount >= 100000) {
      // 1 lakh = 100,000
      double lakh = amount / 100000;
      return "${lakh.toStringAsFixed(lakh.truncateToDouble() == lakh ? 0 : 2)} Lakh";
    } else if (amount >= 1000) {
      // 1 thousand = 1,000
      double thousand = amount / 1000;
      return "${thousand.toStringAsFixed(thousand.truncateToDouble() == thousand ? 0 : 2)} K";
    } else {
      return amount.toString();
    }
  }

  @override
  void initState() {
    super.initState();
    // Load properties with type filter
    context.read<PropertyBloc>().add(
      LoadHomepagePropertiesEvent(type: widget.title),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PropertyBloc, PropertyState>(
      listener: (context, state) {
        if (state is PropertiesLoaded) {
          setState(() {
            propertyList = state.properties;
          });
        } else if (state is PropertyError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.red),
          );
        } else if (state is PropertySaved) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Property saved to wishlist!')),
          );
        }
      },
      builder: (context, state) {
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
                      widget.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1A1A1A),
                        letterSpacing: -0.35,
                        height: 1.4,
                        fontFamily: 'Arial',
                      ),
                    ),
                    Text(
                      '${propertyList.length} properties available',
                      style: const TextStyle(
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
                    setState(() {
                      isfilter = !isfilter;
                    });
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
                  sellPropertyBloc: null,
                ),
              ),
              if (isfilter)
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: PropertyFilterButtons(),
                ),
              // Content area
              Expanded(
                child: state is PropertyLoading
                    ? const Center(child: CircularProgressIndicator())
                    : propertyList.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.home_outlined,
                              size: 64,
                              color: Colors.grey.shade400,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'No properties found',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      )
                    : RefreshIndicator(
                        onRefresh: () async {
                          context.read<PropertyBloc>().add(
                            LoadHomepagePropertiesEvent(type: widget.title),
                          );
                        },
                        child: ListView.builder(
                          itemCount: propertyList.length,
                          itemBuilder: (context, index) {
                            return Padding(
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
                                                borderRadius:
                                                    const BorderRadius.only(
                                                      topLeft: Radius.circular(
                                                        12,
                                                      ),
                                                      topRight: Radius.circular(
                                                        12,
                                                      ),
                                                    ),
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                      propertyList[index]
                                                          .image ??
                                                      "",
                                                  placeholder: (context, url) =>
                                                      const Center(
                                                        child:
                                                            CircularProgressIndicator(),
                                                      ),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          const Icon(
                                                            Icons.error,
                                                          ),
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  fit: BoxFit.cover,
                                                ),
                                                // Image.network(
                                                //                                       context
                                                //                                               .read<ResidentiallistBloc>()
                                                //                                               .propertylist[index]
                                                //                                               .image ??
                                                //                                           "",
                                                //                                       width: double.infinity,
                                                //                                       height: double.infinity,
                                                //                                       fit: BoxFit.cover,
                                                //                                     ),
                                              ),
                                              // Overlays
                                              Positioned(
                                                top: 10,
                                                left: 10,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    // For Sale badge
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              16777200,
                                                            ),
                                                        color: Color(
                                                          int.parse(
                                                            widget.colorcode,
                                                          ),
                                                        ),
                                                      ),
                                                      padding:
                                                          const EdgeInsets.symmetric(
                                                            horizontal: 8,
                                                            vertical: 3,
                                                          ),
                                                      child: const Text(
                                                        'For Sale',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w400,
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
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              16777200,
                                                            ),
                                                        color: Colors.white
                                                            .withOpacity(0.9),
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.black
                                                                .withOpacity(
                                                                  0.1,
                                                                ),
                                                            offset:
                                                                const Offset(
                                                                  0,
                                                                  1,
                                                                ),
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
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              16777200,
                                                            ),
                                                        color: Colors.white
                                                            .withOpacity(0.9),
                                                      ),
                                                      padding:
                                                          const EdgeInsets.symmetric(
                                                            horizontal: 7,
                                                          ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          SvgPicture.asset(
                                                            stargoldIcon,
                                                            width: 10,
                                                            height: 10,
                                                          ),
                                                          const SizedBox(
                                                            width: 4,
                                                          ),
                                                          const Text(
                                                            '4.9',
                                                            style: TextStyle(
                                                              fontSize: 11,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: Color(
                                                                0xFF1A1A1A,
                                                              ),
                                                              height: 1,
                                                              fontFamily:
                                                                  'Arial',
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
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          formatIndianAmount(
                                                            propertyList[index]
                                                                .price,
                                                          ),

                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: Color(
                                                              0xFF1A1A1A,
                                                            ),
                                                            height: 1.4,
                                                            fontFamily: 'Arial',
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 4,
                                                        ),
                                                        Text(
                                                          propertyList[index]
                                                                  .title ??
                                                              "",
                                                          style:
                                                              const TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: Color(
                                                                  0xFF4A5565,
                                                                ),
                                                                height: 1,
                                                                fontFamily:
                                                                    'Arial',
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  // Villa badge
                                                  Container(
                                                    height: 22,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            6,
                                                          ),
                                                      border: Border.all(
                                                        color: const Color(
                                                          0xFFE5E7EB,
                                                        ),
                                                        width: 1,
                                                      ),
                                                    ),
                                                    padding:
                                                        const EdgeInsets.symmetric(
                                                          horizontal: 7,
                                                          vertical: 3,
                                                        ),
                                                    child: Text(
                                                      propertyList[index]
                                                          .type
                                                          .value,
                                                      style: const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Color(
                                                          0xFF4A5565,
                                                        ),
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
                                                  Expanded(
                                                    child: Text(
                                                      propertyList[index]
                                                          .location
                                                          .fullAddress,
                                                      style: const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Color(
                                                          0xFF6A7282,
                                                        ),
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
                                                  propertyList[index].layout ==
                                                          null
                                                      ? const SizedBox()
                                                      : Expanded(
                                                          child: Row(
                                                            children: [
                                                              SvgPicture.asset(
                                                                bedIcon,
                                                                width: 18,
                                                                height: 18,
                                                              ),
                                                              const SizedBox(
                                                                width: 4,
                                                              ),
                                                              Text(
                                                                "${propertyList[index].layout!.bedrooms} Bed",
                                                                style: const TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: Color(
                                                                    0xFF4A5565,
                                                                  ),
                                                                  height: 1,
                                                                  fontFamily:
                                                                      'Arial',
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                  // Bath
                                                  propertyList[index].layout ==
                                                          null
                                                      ? const SizedBox()
                                                      : Expanded(
                                                          child: Row(
                                                            children: [
                                                              SvgPicture.asset(
                                                                bathIcon,
                                                                width: 18,
                                                                height: 18,
                                                              ),
                                                              const SizedBox(
                                                                width: 4,
                                                              ),
                                                              Text(
                                                                "${propertyList[index].layout!.bathrooms} Bath",
                                                                style: const TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: Color(
                                                                    0xFF4A5565,
                                                                  ),
                                                                  height: 1,
                                                                  fontFamily:
                                                                      'Arial',
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
                                                        const SizedBox(
                                                          width: 4,
                                                        ),
                                                        Text(
                                                          '${propertyList[index].sqft} sqft',
                                                          style:
                                                              const TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: Color(
                                                                  0xFF4A5565,
                                                                ),
                                                                height: 1,
                                                                fontFamily:
                                                                    'Arial',
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
                                                padding: const EdgeInsets.only(
                                                  top: 12,
                                                ),
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: const Text(
                                                        'By',
                                                        style: TextStyle(
                                                          fontSize: 11,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Color(
                                                            0xFF6A7282,
                                                          ),
                                                          height: 1,
                                                          fontFamily: 'Arial',
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 8),
                                                    Expanded(
                                                      child: InkWell(
                                                        onTap: () {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder: (context) {
                                                                return ResidentialDetailScreen(
                                                                  property: Property(
                                                                    id:
                                                                        propertyList[index]
                                                                            .id ??
                                                                        "",
                                                                    imageUrl:
                                                                        propertyList[index]
                                                                            .image ??
                                                                        "",
                                                                    status:
                                                                        "For Sale",
                                                                    price:
                                                                        "₹ ${propertyList[index].price}",
                                                                    name: propertyList[index]
                                                                        .title,
                                                                    type: propertyList[index]
                                                                        .type
                                                                        .value,
                                                                    location: propertyList[index]
                                                                        .location
                                                                        .fullAddress,
                                                                    bedrooms:
                                                                        propertyList[index]
                                                                            .layout
                                                                            ?.bedrooms ??
                                                                        0,
                                                                    bathrooms:
                                                                        propertyList[index]
                                                                            .layout
                                                                            ?.bathrooms ??
                                                                        0,
                                                                    sqft:
                                                                        propertyList[index]
                                                                            .sqft
                                                                            ?.toInt() ??
                                                                        0,
                                                                    description:
                                                                        propertyList[index]
                                                                            .about ??
                                                                        "",
                                                                    builtYear:
                                                                        "2018",
                                                                    features:
                                                                        propertyList[index]
                                                                            .amenities ??
                                                                        [],
                                                                  ),
                                                                  colorcode: widget
                                                                      .colorcode,
                                                                  properytype:
                                                                      widget
                                                                          .type,
                                                                  title: widget
                                                                      .title,
                                                                );
                                                              },
                                                            ),
                                                          );
                                                        },
                                                        child: Container(
                                                          height: 40,
                                                          decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  16777200,
                                                                ),
                                                            color: Color(
                                                              int.parse(
                                                                widget
                                                                    .colorcode,
                                                              ),
                                                            ),
                                                          ),
                                                          child: const Center(
                                                            child: Text(
                                                              'View Details',
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: Colors
                                                                    .white,
                                                                fontFamily:
                                                                    'Arial',
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
                            );
                          },
                        ),
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
