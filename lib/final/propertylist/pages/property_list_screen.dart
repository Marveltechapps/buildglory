import 'package:buildglory/constant/constant.dart';
import 'package:buildglory/final/propertylist/bloc/residentiallist_bloc.dart';
import 'package:buildglory/final/propertylist/bloc/residentiallist_event.dart';
import 'package:buildglory/final/propertylist/bloc/residentiallist_state.dart';
import 'package:buildglory/final/propertylist/model/property_list_response_mode.dart';
import 'package:buildglory/final/propertylist/widgets/filter_widget.dart';
import 'package:buildglory/new/presentation/profile/widgets/custom_input_field.dart';
import 'package:buildglory/screens/residential/models/property.dart';
import 'package:buildglory/screens/residential/detail/residential_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class PropertyListScreen extends StatelessWidget {
  final String title;
  final String type;
  final String colorcode;

  const PropertyListScreen({
    super.key,
    required this.title,
    required this.type,
    required this.colorcode,
  });

  static TextEditingController searchController = TextEditingController();
  static bool isfilter = false;
  static List<PropertyListResponseModel> propertlist = [];

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
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResidentiallistBloc(),
      child: BlocConsumer<ResidentiallistBloc, ResidentiallistState>(
        listener: (context, state) {
          if (state is ResidentialListApiSuccessState) {
            context.read<ResidentiallistBloc>().propertylist =
                state.propertyListResponseModel;
            propertlist = state.propertyListResponseModel;
          }
        },
        builder: (context, state) {
          if (state is ResidentialListInitialState) {
            context.read<ResidentiallistBloc>().add(
              GetPropertyListApiEvent(propertytitle: title),
            );
          }
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
                       sellPropertyBloc:   null,
                  ),
                ),
                if (isfilter)
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 20,
                      right: 20,
                    ),
                    child: PropertyFilterButtons(),
                  ),
                // Content area
                Expanded(
                  child: ListView.builder(
                    itemCount: propertlist.length,
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
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(12),
                                            topRight: Radius.circular(12),
                                          ),
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                propertlist[index].image ?? "",
                                            placeholder: (context, url) => Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Icon(Icons.error),
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
                                                    int.parse(colorcode),
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
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        16777200,
                                                      ),
                                                  color: Colors.white
                                                      .withOpacity(0.9),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(0.1),
                                                      offset: const Offset(
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
                                                    const SizedBox(width: 4),
                                                    const Text(
                                                      '4.9',
                                                      style: TextStyle(
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: Color(
                                                          0xFF1A1A1A,
                                                        ),
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    formatIndianAmount(
                                                      propertlist[index]
                                                              .price ??
                                                          0,
                                                    ),

                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Color(0xFF1A1A1A),
                                                      height: 1.4,
                                                      fontFamily: 'Arial',
                                                    ),
                                                  ),
                                                  const SizedBox(height: 4),
                                                  Text(
                                                    propertlist[index].title ??
                                                        "",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
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
                                                borderRadius:
                                                    BorderRadius.circular(6),
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
                                                propertlist[index].type ?? "",
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
                                            Expanded(
                                              child: Text(
                                                propertlist[index]
                                                        .location
                                                        ?.fullAddress ??
                                                    "",
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
                                            propertlist[index].layout == null
                                                ? SizedBox()
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
                                                          "${propertlist[index].layout!.bedrooms} Bed",
                                                          style: TextStyle(
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
                                                      ],
                                                    ),
                                                  ),
                                            // Bath
                                            propertlist[index].layout == null
                                                ? SizedBox()
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
                                                          "${propertlist[index].layout!.bathrooms} Bath",
                                                          style: TextStyle(
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
                                                  Text(
                                                    '${propertlist[index].sqft} sqft',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
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
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) {
                                                          return /* title == "Plots"
                                                              ? PlotDetailsScreen()
                                                              :  */ ResidentialDetailScreen(
                                                            property: Property(
                                                              id:
                                                                  propertlist[index]
                                                                      .id ??
                                                                  "",
                                                              imageUrl:
                                                                  propertlist[index]
                                                                      .image ??
                                                                  "",
                                                              status:
                                                                  "For Sale",
                                                              price:
                                                                  "₹ ${propertlist[index].price}",
                                                              name:
                                                                  propertlist[index]
                                                                      .title ??
                                                                  "",
                                                              type:
                                                                  propertlist[index]
                                                                      .type ??
                                                                  "",
                                                              location:
                                                                  propertlist[index]
                                                                      .location
                                                                      ?.fullAddress ??
                                                                  "",
                                                              bedrooms:
                                                                  propertlist[index]
                                                                      .layout
                                                                      ?.bedrooms ??
                                                                  0,
                                                              bathrooms:
                                                                  propertlist[index]
                                                                      .layout
                                                                      ?.bathrooms ??
                                                                  0,
                                                              sqft:
                                                                  propertlist[index]
                                                                      .sqft ??
                                                                  0,
                                                              description:
                                                                  propertlist[index]
                                                                      .about ??
                                                                  "",
                                                              builtYear: "2018",
                                                              features:
                                                                  propertlist[index]
                                                                      .amenities ??
                                                                  [],
                                                            ),
                                                            colorcode:
                                                                colorcode,
                                                            properytype: type,
                                                            title: title,
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
                                                        int.parse(colorcode),
                                                      ),
                                                    ),
                                                    child: const Center(
                                                      child: Text(
                                                        'View Details',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w400,
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
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
