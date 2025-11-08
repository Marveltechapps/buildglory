import 'package:buildglory/constant/constant.dart';
import 'package:buildglory/presentation/exchange/pages/exchange_screen.dart';
import 'package:buildglory/presentation/home/bloc/home_bloc.dart';
import 'package:buildglory/presentation/home/bloc/home_event.dart';
import 'package:buildglory/presentation/home/bloc/home_state.dart';
import 'package:buildglory/presentation/organichomes/pages/organic_homes_page.dart';
import 'package:buildglory/presentation/sell/pages/sell_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class HomePageBuy extends StatelessWidget {
  const HomePageBuy({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is SelectedTypeState) {
            context.read<HomeBloc>().selectedTypeValue = state.title;
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color(0xFFF9FAFB),
            body: SafeArea(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 480),
                child: Column(
                  children: [
                    // Header Container
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.fromLTRB(14, 16, 14, 0),
                      child: Column(
                        children: [
                          // Header
                          SizedBox(
                            height: 42,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                // Header Content
                                Column(
                                  spacing: 5,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Title Container
                                    const Text(
                                      'Hey Ababa !',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xFF101828),
                                        fontFamily: 'Arial',
                                        fontWeight: FontWeight.w400,
                                        height: 1.4,
                                      ),
                                    ),
                                    // Paragraph
                                    const Text(
                                      'Find, Flip, Flourish',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Color(0xFF4A5565),
                                        fontFamily: 'Arial',
                                        fontWeight: FontWeight.w400,
                                        height: 1,
                                      ),
                                    ),
                                  ],
                                ),
                                // Profile Image
                                Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(7),
                                    child: SvgPicture.asset(notificationIcon),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Progress Bar Container
                          Container(
                            margin: const EdgeInsets.only(top: 21),
                            padding: const EdgeInsets.fromLTRB(7, 4, 7, 0),
                            height: 56,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: const Color(0xFFF3F4F6),
                            ),
                            child: Row(
                              children: [
                                // Sell Button
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      context.read<HomeBloc>().add(
                                        SelectTypeEvent(title: "Sell"),
                                      );
                                    },
                                    child: Container(
                                      height: 49,
                                      decoration:
                                          context
                                                  .read<HomeBloc>()
                                                  .selectedTypeValue ==
                                              "Sell"
                                          ? BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(13),
                                              color: Colors.white,
                                              border: Border.all(
                                                color: const Color(0xFFB9F8CF),
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.1),
                                                  blurRadius: 3,
                                                  offset: const Offset(0, 1),
                                                ),
                                              ],
                                            )
                                          : null,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 28,
                                            height: 18,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(9),
                                              color: const Color(0xFFF3F4F6),
                                            ),
                                            child: Center(
                                              child: SvgPicture.asset(sellIcon),
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          const Text(
                                            'Sell',
                                            style: TextStyle(
                                              fontSize: 11,
                                              color: Color(0xFF6A7282),
                                              fontFamily: 'Arial',
                                              fontWeight: FontWeight.w400,
                                              height: 1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 7),
                                // Buy Button (Active)
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      context.read<HomeBloc>().add(
                                        SelectTypeEvent(title: "Buy"),
                                      );
                                    },
                                    child: Container(
                                      height: 49,
                                      decoration:
                                          context
                                                  .read<HomeBloc>()
                                                  .selectedTypeValue ==
                                              "Buy"
                                          ? BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(13),
                                              color: Colors.white,
                                              border: Border.all(
                                                color: const Color(0xFFB9F8CF),
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.1),
                                                  blurRadius: 3,
                                                  offset: const Offset(0, 1),
                                                ),
                                              ],
                                            )
                                          : null,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 28,
                                            height: 16,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(9),
                                              color: const Color(0xFFDCFCE7),
                                            ),
                                            child: Center(
                                              child: SvgPicture.asset(buyIcon),
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          const Text(
                                            'Buy',
                                            style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.black,
                                              fontFamily: 'Arial',
                                              fontWeight: FontWeight.w400,
                                              height: 1,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 7),
                                // Exchange Button
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      context.read<HomeBloc>().add(
                                        SelectTypeEvent(title: "Exchange"),
                                      );
                                    },
                                    child: Container(
                                      height: 49,
                                      decoration:
                                          context
                                                  .read<HomeBloc>()
                                                  .selectedTypeValue ==
                                              "Exchange"
                                          ? BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(13),
                                              color: Colors.white,
                                              border: Border.all(
                                                color: const Color(0xFFB9F8CF),
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.1),
                                                  blurRadius: 3,
                                                  offset: const Offset(0, 1),
                                                ),
                                              ],
                                            )
                                          : null,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 28,
                                            height: 18,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(9),
                                              color: const Color(0xFFF3F4F6),
                                            ),
                                            child: Center(
                                              child: SvgPicture.asset(
                                                exchangeIcon,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          const Text(
                                            'Exchange',
                                            style: TextStyle(
                                              fontSize: 11,
                                              color: Color(0xFF6A7282),
                                              fontFamily: 'Arial',
                                              fontWeight: FontWeight.w400,
                                              height: 1,
                                            ),
                                          ),
                                        ],
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
                    // Form Container
                    context.read<HomeBloc>().selectedTypeValue == "Sell"
                        ? Expanded(child: SellPage())
                        : context.read<HomeBloc>().selectedTypeValue == "Buy"
                        ? Expanded(
                            child: SingleChildScrollView(
                              padding: const EdgeInsets.fromLTRB(0, 14, 0, 41),
                              child: Column(
                                children: [
                                  // Search Section
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 14,
                                    ),
                                    child: Column(
                                      children: [
                                        // Search Bar
                                        Stack(
                                          children: [
                                            Container(
                                              //height: 41,
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                    35,
                                                    14,
                                                    14,
                                                    14,
                                                  ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(13),
                                                color: const Color(0xFFF9FAFB),
                                                border: Border.all(
                                                  color: const Color(
                                                    0xFFE5E7EB,
                                                  ),
                                                ),
                                              ),
                                              child: const Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  'Search properties, locations, neighborhoods...',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Color(0xFF0A0A0A),
                                                    fontFamily: 'Arial',
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 11,
                                              top: 0,
                                              bottom: 0,
                                              child: Center(
                                                child: SvgPicture.asset(
                                                  searchIcon,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        // Featured Property Card
                                        Container(
                                          margin: const EdgeInsets.only(
                                            top: 28,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              13,
                                            ),
                                            color: Colors.white,
                                            border: Border.all(
                                              color: Colors.black.withOpacity(
                                                0.1,
                                              ),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(
                                                  0.1,
                                                ),
                                                blurRadius: 25,
                                                offset: const Offset(0, 20),
                                              ),
                                            ],
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              13,
                                            ),
                                            child: Stack(
                                              children: [
                                                AspectRatio(
                                                  aspectRatio: 2.06,
                                                  child: Image.network(
                                                    'https://api.builder.io/api/v1/image/assets/f9d3014b66ec4ab0b700dbedbaba9803/42a00829831fa8b5638359e90ebc4d88f5d22cf0?placeholderIfAbsent=true',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Positioned.fill(
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.fromLTRB(
                                                          21,
                                                          20,
                                                          21,
                                                          20,
                                                        ),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        const Text(
                                                          'Prime Land Investments',
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors.white,
                                                            fontFamily: 'Arial',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            height: 1,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 0,
                                                        ),
                                                        const Text(
                                                          'High ROI • DTCP Approved • Ready to Build',
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color: Color(
                                                              0xFFFFEDD4,
                                                            ),
                                                            fontFamily: 'Arial',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            height: 1,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 7,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                const Text(
                                                                  'Starting from',
                                                                  style: TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color: Color(
                                                                      0xFFFFEDD4,
                                                                    ),
                                                                    fontFamily:
                                                                        'Arial',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    height: 1,
                                                                  ),
                                                                ),
                                                                const Text(
                                                                  '₹75 Lakhs',
                                                                  style: TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color: Colors
                                                                        .white,
                                                                    fontFamily:
                                                                        'Arial',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    height: 1,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(
                                                              width: 14,
                                                            ),
                                                            Container(
                                                              width: 1,
                                                              height: 28,
                                                              color: Colors
                                                                  .white
                                                                  .withOpacity(
                                                                    0.3,
                                                                  ),
                                                            ),
                                                            const SizedBox(
                                                              width: 14,
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                const Text(
                                                                  'Size',
                                                                  style: TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color: Color(
                                                                      0xFFFFEDD4,
                                                                    ),
                                                                    fontFamily:
                                                                        'Arial',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    height: 1,
                                                                  ),
                                                                ),
                                                                const Text(
                                                                  '1800+ sqft',
                                                                  style: TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color: Colors
                                                                        .white,
                                                                    fontFamily:
                                                                        'Arial',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    height: 1,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 14,
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder: (context) {
                                                                  return OrganicHomesPage();
                                                                },
                                                              ),
                                                            );
                                                          },
                                                          child: Container(
                                                            padding:
                                                                const EdgeInsets.fromLTRB(
                                                                  21,
                                                                  7,
                                                                  20,
                                                                  7,
                                                                ),
                                                            decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                    9,
                                                                  ),
                                                              color:
                                                                  const Color(
                                                                    0xFFFF6900,
                                                                  ),
                                                            ),
                                                            child: const Text(
                                                              'Explore Plots',
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                color: Colors
                                                                    .white,
                                                                fontFamily:
                                                                    'Arial',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                height: 1,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Quick Explore Section
                                  Container(
                                    margin: const EdgeInsets.only(top: 14),
                                    padding: const EdgeInsets.fromLTRB(
                                      14,
                                      21,
                                      14,
                                      0,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Quick Explore',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xFF101828),
                                            fontFamily: 'Arial',
                                            fontWeight: FontWeight.w400,
                                            height: 2,
                                          ),
                                        ),
                                        const SizedBox(height: 14),
                                        // Apartments Card
                                        Container(
                                          padding: const EdgeInsets.fromLTRB(
                                            14,
                                            15,
                                            0,
                                            15,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              13,
                                            ),
                                            border: Border.all(
                                              color: const Color(0xFFBEDBFF),
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 56,
                                                height: 56,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(14),
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(14),
                                                  child: Image.network(
                                                    'https://api.builder.io/api/v1/image/assets/f9d3014b66ec4ab0b700dbedbaba9803/d69b5a643eda84b94816ab587bbc2a2fc42d2d92?placeholderIfAbsent=true',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 14),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      'Apartments',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: Color(
                                                          0xFF101828,
                                                        ),
                                                        fontFamily: 'Arial',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height: 1,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 4),
                                                    const Text(
                                                      '1,200+ listings available',
                                                      style: TextStyle(
                                                        fontSize: 11,
                                                        color: Color(
                                                          0xFF4A5565,
                                                        ),
                                                        fontFamily: 'Arial',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height: 1,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 4),
                                                    const Text(
                                                      'Modern residential complexes',
                                                      style: TextStyle(
                                                        fontSize: 11,
                                                        color: Color(
                                                          0xFF6A7282,
                                                        ),
                                                        fontFamily: 'Arial',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height: 1,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: 62,
                                                height: 28,
                                                margin: const EdgeInsets.only(
                                                  right: 14,
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                ),
                                                child: const Center(
                                                  child: Text(
                                                    'Explore',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Color(0xFF155DFC),
                                                      fontFamily: 'Arial',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 1,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 11),
                                        // Villas Card
                                        Container(
                                          padding: const EdgeInsets.fromLTRB(
                                            14,
                                            15,
                                            0,
                                            15,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              13,
                                            ),
                                            border: Border.all(
                                              color: const Color(0xFFB9F8CF),
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 56,
                                                height: 56,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(14),
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(14),
                                                  child: Image.network(
                                                    'https://api.builder.io/api/v1/image/assets/f9d3014b66ec4ab0b700dbedbaba9803/9f093d2313dc027edc7aac9490ee318afdf97e63?placeholderIfAbsent=true',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 14),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      'Villas',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: Color(
                                                          0xFF101828,
                                                        ),
                                                        fontFamily: 'Arial',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height: 1,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 4),
                                                    const Text(
                                                      '800+ listings available',
                                                      style: TextStyle(
                                                        fontSize: 11,
                                                        color: Color(
                                                          0xFF4A5565,
                                                        ),
                                                        fontFamily: 'Arial',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height: 1,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 4),
                                                    const Text(
                                                      'Luxury independent houses',
                                                      style: TextStyle(
                                                        fontSize: 11,
                                                        color: Color(
                                                          0xFF6A7282,
                                                        ),
                                                        fontFamily: 'Arial',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height: 1,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: 62,
                                                height: 28,
                                                margin: const EdgeInsets.only(
                                                  right: 14,
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                ),
                                                child: const Center(
                                                  child: Text(
                                                    'Explore',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Color(0x0000A63E),
                                                      fontFamily: 'Arial',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 1,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 11),
                                        // Commercial Card
                                        Container(
                                          padding: const EdgeInsets.fromLTRB(
                                            14,
                                            15,
                                            0,
                                            15,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              13,
                                            ),
                                            border: Border.all(
                                              color: const Color(0xFFE9D4FF),
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 56,
                                                height: 56,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(14),
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(14),
                                                  child: Image.network(
                                                    'https://api.builder.io/api/v1/image/assets/f9d3014b66ec4ab0b700dbedbaba9803/f9637687f7bcf10d0afcdacdebb13d9f2e48d90d?placeholderIfAbsent=true',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 14),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      'Commercial',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: Color(
                                                          0xFF101828,
                                                        ),
                                                        fontFamily: 'Arial',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height: 1,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 4),
                                                    const Text(
                                                      '3+ listings available',
                                                      style: TextStyle(
                                                        fontSize: 11,
                                                        color: Color(
                                                          0xFF4A5565,
                                                        ),
                                                        fontFamily: 'Arial',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height: 1,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 4),
                                                    const Text(
                                                      'Office spaces & retail',
                                                      style: TextStyle(
                                                        fontSize: 11,
                                                        color: Color(
                                                          0xFF6A7282,
                                                        ),
                                                        fontFamily: 'Arial',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height: 1,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: 62,
                                                height: 28,
                                                margin: const EdgeInsets.only(
                                                  right: 14,
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                ),
                                                child: const Center(
                                                  child: Text(
                                                    'Explore',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Color(0xFF9810FA),
                                                      fontFamily: 'Arial',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 1,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 11),
                                        // Plots Card
                                        Container(
                                          padding: const EdgeInsets.fromLTRB(
                                            14,
                                            15,
                                            0,
                                            15,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              13,
                                            ),
                                            border: Border.all(
                                              color: const Color(0xFFFFD6A7),
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 56,
                                                height: 56,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(14),
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(14),
                                                  child: Image.network(
                                                    'https://api.builder.io/api/v1/image/assets/f9d3014b66ec4ab0b700dbedbaba9803/3b76bc244811ebefa0795b56d0984fe6ccfb0626?placeholderIfAbsent=true',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 14),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      'Plots',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: Color(
                                                          0xFF101828,
                                                        ),
                                                        fontFamily: 'Arial',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height: 1,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 4),
                                                    const Text(
                                                      '4+ listings available',
                                                      style: TextStyle(
                                                        fontSize: 11,
                                                        color: Color(
                                                          0xFF4A5565,
                                                        ),
                                                        fontFamily: 'Arial',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height: 1,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 4),
                                                    const Text(
                                                      'Residential & commercial land',
                                                      style: TextStyle(
                                                        fontSize: 11,
                                                        color: Color(
                                                          0xFF6A7282,
                                                        ),
                                                        fontFamily: 'Arial',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height: 1,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: 62,
                                                height: 28,
                                                margin: const EdgeInsets.only(
                                                  right: 14,
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                ),
                                                child: const Center(
                                                  child: Text(
                                                    'Explore',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Color(0xFFF54900),
                                                      fontFamily: 'Arial',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 1,
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
                                  // Recommended for You Section
                                  Container(
                                    margin: const EdgeInsets.only(top: 17),
                                    padding: const EdgeInsets.only(left: 14),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Recommended for You',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xFF101828),
                                            fontFamily: 'Arial',
                                            fontWeight: FontWeight.w400,
                                            height: 2,
                                          ),
                                        ),
                                        const SizedBox(height: 17),
                                        Container(
                                          height: 164,
                                          child: ListView(
                                            scrollDirection: Axis.horizontal,
                                            padding: const EdgeInsets.only(
                                              right: 14,
                                            ),
                                            children: [
                                              // Property Card 1
                                              Container(
                                                width:
                                                    MediaQuery.of(
                                                      context,
                                                    ).size.width /
                                                    1.3,
                                                margin: const EdgeInsets.only(
                                                  right: 14,
                                                ),
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                      14,
                                                      15,
                                                      0,
                                                      15,
                                                    ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(13),
                                                  color: Colors.white,
                                                  border: Border.all(
                                                    color: Colors.black
                                                        .withOpacity(0.1),
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(0.1),
                                                      blurRadius: 3,
                                                      offset: const Offset(
                                                        0,
                                                        1,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          width: 70,
                                                          height: 70,
                                                          decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  13,
                                                                ),
                                                            color: const Color(
                                                              0xFFF3F4F6,
                                                            ),
                                                          ),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  13,
                                                                ),
                                                            child: Image.network(
                                                              'https://api.builder.io/api/v1/image/assets/f9d3014b66ec4ab0b700dbedbaba9803/57cc9c68a57b7e82a6bcf7d4688e7e9953378485?placeholderIfAbsent=true',
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 14,
                                                        ),
                                                        Expanded(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              const Text(
                                                                'Phoenix Meadows Villa',
                                                                style: TextStyle(
                                                                  fontSize: 12,
                                                                  color: Color(
                                                                    0xFF101828,
                                                                  ),
                                                                  fontFamily:
                                                                      'Arial',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  height: 1,
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 4,
                                                              ),
                                                              const Text(
                                                                'OMR (IT Corridor), Chennai',
                                                                style: TextStyle(
                                                                  fontSize: 11,
                                                                  color: Color(
                                                                    0xFF4A5565,
                                                                  ),
                                                                  fontFamily:
                                                                      'Arial',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  height: 1,
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 4,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  const Text(
                                                                    '₹1.2 Crores',
                                                                    style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      color: Color(
                                                                        0x0000A63E,
                                                                      ),
                                                                      fontFamily:
                                                                          'Arial',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      height: 1,
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            28,
                                                                        height:
                                                                            28,
                                                                        decoration: BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(
                                                                                7,
                                                                              ),
                                                                        ),
                                                                        child: Center(
                                                                          child: Icon(
                                                                            Icons.favorite_border,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            4,
                                                                      ),
                                                                      Container(
                                                                        height:
                                                                            28,
                                                                        padding:
                                                                            const EdgeInsets.fromLTRB(
                                                                              11,
                                                                              0,
                                                                              10,
                                                                              0,
                                                                            ),
                                                                        decoration: BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(
                                                                                7,
                                                                              ),
                                                                          color: const Color(
                                                                            0xFF030213,
                                                                          ),
                                                                        ),
                                                                        child: const Center(
                                                                          child: Text(
                                                                            'View',
                                                                            style: TextStyle(
                                                                              fontSize: 11,
                                                                              color: Colors.white,
                                                                              fontFamily: 'Arial',
                                                                              fontWeight: FontWeight.w400,
                                                                              height: 1,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                            top: 32,
                                                          ),
                                                      padding:
                                                          const EdgeInsets.only(
                                                            top: 12,
                                                          ),
                                                      decoration:
                                                          const BoxDecoration(
                                                            border: Border(
                                                              top: BorderSide(
                                                                color: Color(
                                                                  0xFFF3F4F6,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              // Image.network(
                                                              //   'https://api.builder.io/api/v1/image/assets/f9d3014b66ec4ab0b700dbedbaba9803/4fada21da215a71c50d234276459e74ffe2c403e?placeholderIfAbsent=true',
                                                              //   width: 11,
                                                              //   height: 10,
                                                              // ),
                                                              const SizedBox(
                                                                width: 4,
                                                              ),
                                                              const Text(
                                                                '4 BR',
                                                                style: TextStyle(
                                                                  fontSize: 11,
                                                                  color: Colors
                                                                      .black,
                                                                  fontFamily:
                                                                      'Arial',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  height: 1,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              // Image.network(
                                                              //   'https://api.builder.io/api/v1/image/assets/f9d3014b66ec4ab0b700dbedbaba9803/e471ee565a61c427e7e2409bf3d2fbc1538b5784?placeholderIfAbsent=true',
                                                              //   width: 10,
                                                              //   height: 10,
                                                              // ),
                                                              const SizedBox(
                                                                width: 4,
                                                              ),
                                                              const Text(
                                                                '2850 sqft',
                                                                style: TextStyle(
                                                                  fontSize: 11,
                                                                  color: Color(
                                                                    0xFF6A7282,
                                                                  ),
                                                                  fontFamily:
                                                                      'Arial',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  height: 1,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Container(
                                                                width: 7,
                                                                height: 7,
                                                                decoration: const BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  color: Color(
                                                                    0x0000C950,
                                                                  ),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                width: 4,
                                                              ),
                                                              const Text(
                                                                'Available',
                                                                style: TextStyle(
                                                                  fontSize: 11,
                                                                  color: Color(
                                                                    0xFF6A7282,
                                                                  ),
                                                                  fontFamily:
                                                                      'Arial',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  height: 1,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              // Additional property cards would go here
                                              Container(
                                                width:
                                                    MediaQuery.of(
                                                      context,
                                                    ).size.width /
                                                    1.3,
                                                margin: const EdgeInsets.only(
                                                  right: 14,
                                                ),
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                      14,
                                                      15,
                                                      0,
                                                      15,
                                                    ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(13),
                                                  color: Colors.white,
                                                  border: Border.all(
                                                    color: Colors.black
                                                        .withOpacity(0.1),
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.black
                                                          .withOpacity(0.1),
                                                      blurRadius: 3,
                                                      offset: const Offset(
                                                        0,
                                                        1,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          width: 70,
                                                          height: 70,
                                                          decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  13,
                                                                ),
                                                            color: const Color(
                                                              0xFFF3F4F6,
                                                            ),
                                                          ),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  13,
                                                                ),
                                                            child: Image.network(
                                                              'https://api.builder.io/api/v1/image/assets/f9d3014b66ec4ab0b700dbedbaba9803/57cc9c68a57b7e82a6bcf7d4688e7e9953378485?placeholderIfAbsent=true',
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 14,
                                                        ),
                                                        Expanded(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              const Text(
                                                                'Phoenix Meadows Villa',
                                                                style: TextStyle(
                                                                  fontSize: 12,
                                                                  color: Color(
                                                                    0xFF101828,
                                                                  ),
                                                                  fontFamily:
                                                                      'Arial',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  height: 1,
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 4,
                                                              ),
                                                              const Text(
                                                                'OMR (IT Corridor), Chennai',
                                                                style: TextStyle(
                                                                  fontSize: 11,
                                                                  color: Color(
                                                                    0xFF4A5565,
                                                                  ),
                                                                  fontFamily:
                                                                      'Arial',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  height: 1,
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 4,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  const Text(
                                                                    '₹1.2 Crores',
                                                                    style: TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      color: Color(
                                                                        0x0000A63E,
                                                                      ),
                                                                      fontFamily:
                                                                          'Arial',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      height: 1,
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            28,
                                                                        height:
                                                                            28,
                                                                        decoration: BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(
                                                                                7,
                                                                              ),
                                                                        ),
                                                                        child: Center(
                                                                          child: Icon(
                                                                            Icons.favorite_border,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            4,
                                                                      ),
                                                                      Container(
                                                                        height:
                                                                            28,
                                                                        padding:
                                                                            const EdgeInsets.fromLTRB(
                                                                              11,
                                                                              0,
                                                                              10,
                                                                              0,
                                                                            ),
                                                                        decoration: BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(
                                                                                7,
                                                                              ),
                                                                          color: const Color(
                                                                            0xFF030213,
                                                                          ),
                                                                        ),
                                                                        child: const Center(
                                                                          child: Text(
                                                                            'View',
                                                                            style: TextStyle(
                                                                              fontSize: 11,
                                                                              color: Colors.white,
                                                                              fontFamily: 'Arial',
                                                                              fontWeight: FontWeight.w400,
                                                                              height: 1,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                            top: 32,
                                                          ),
                                                      padding:
                                                          const EdgeInsets.only(
                                                            top: 12,
                                                          ),
                                                      decoration:
                                                          const BoxDecoration(
                                                            border: Border(
                                                              top: BorderSide(
                                                                color: Color(
                                                                  0xFFF3F4F6,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              // Image.network(
                                                              //   'https://api.builder.io/api/v1/image/assets/f9d3014b66ec4ab0b700dbedbaba9803/4fada21da215a71c50d234276459e74ffe2c403e?placeholderIfAbsent=true',
                                                              //   width: 11,
                                                              //   height: 10,
                                                              // ),
                                                              const SizedBox(
                                                                width: 4,
                                                              ),
                                                              const Text(
                                                                '4 BR',
                                                                style: TextStyle(
                                                                  fontSize: 11,
                                                                  color: Colors
                                                                      .black,
                                                                  fontFamily:
                                                                      'Arial',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  height: 1,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              // Image.network(
                                                              //   'https://api.builder.io/api/v1/image/assets/f9d3014b66ec4ab0b700dbedbaba9803/e471ee565a61c427e7e2409bf3d2fbc1538b5784?placeholderIfAbsent=true',
                                                              //   width: 10,
                                                              //   height: 10,
                                                              // ),
                                                              const SizedBox(
                                                                width: 4,
                                                              ),
                                                              const Text(
                                                                '2850 sqft',
                                                                style: TextStyle(
                                                                  fontSize: 11,
                                                                  color: Color(
                                                                    0xFF6A7282,
                                                                  ),
                                                                  fontFamily:
                                                                      'Arial',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  height: 1,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Container(
                                                                width: 7,
                                                                height: 7,
                                                                decoration: const BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  color: Color(
                                                                    0x0000C950,
                                                                  ),
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                width: 4,
                                                              ),
                                                              const Text(
                                                                'Available',
                                                                style: TextStyle(
                                                                  fontSize: 11,
                                                                  color: Color(
                                                                    0xFF6A7282,
                                                                  ),
                                                                  fontFamily:
                                                                      'Arial',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  height: 1,
                                                                ),
                                                              ),
                                                            ],
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
                                  // Organic Homes Section
                                  Container(
                                    margin: const EdgeInsets.only(top: 21),
                                    padding: const EdgeInsets.fromLTRB(
                                      14,
                                      21,
                                      14,
                                      0,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Organic Homes',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xFF101828),
                                            fontFamily: 'Arial',
                                            fontWeight: FontWeight.w400,
                                            height: 2,
                                          ),
                                        ),
                                        const SizedBox(height: 14),
                                        Container(
                                          padding: const EdgeInsets.all(18),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              13,
                                            ),
                                            border: Border.all(
                                              color: const Color(0xFFA4F4CF),
                                            ),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    width: 42,
                                                    height: 42,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            14,
                                                          ),
                                                      color: const Color(
                                                        0xFFD0FAE5,
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: SvgPicture.asset(
                                                        ecoIcon,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 11),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const Text(
                                                        'Eco-Friendly Properties',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: Color(
                                                            0xFF101828,
                                                          ),
                                                          fontFamily: 'Arial',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height: 1,
                                                        ),
                                                      ),
                                                      const SizedBox(height: 4),
                                                      const Text(
                                                        'Sustainable living solutions',
                                                        style: TextStyle(
                                                          fontSize: 11,
                                                          color: Color(
                                                            0xFF4A5565,
                                                          ),
                                                          fontFamily: 'Arial',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height: 1,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 13),
                                              const Text(
                                                'Discover homes built with sustainable materials and energy-efficient designs.',
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  color: Color(0xFF4A5565),
                                                  fontFamily: 'Arial',
                                                  fontWeight: FontWeight.w400,
                                                  height: 1.27,
                                                ),
                                              ),
                                              const SizedBox(height: 15),
                                              Container(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                      11,
                                                      5,
                                                      11,
                                                      5,
                                                    ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                  color: const Color(
                                                    0x00009966,
                                                  ),
                                                ),
                                                child: const Text(
                                                  'Explore Organic Homes',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontFamily: 'Arial',
                                                    fontWeight: FontWeight.w400,
                                                    height: 1,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Why Choose Built Glory Section
                                  Container(
                                    margin: const EdgeInsets.only(top: 21),
                                    padding: const EdgeInsets.all(22),
                                    constraints: const BoxConstraints(
                                      maxWidth: 349,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(21),
                                      color: Colors.white,
                                      border: Border.all(
                                        color: const Color(0xFFF3F4F6),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.1),
                                          blurRadius: 3,
                                          offset: const Offset(0, 1),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        // Header
                                        Column(
                                          children: [
                                            const Text(
                                              'Why Choose Built Glory?',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Color(0xFF101828),
                                                fontFamily: 'Arial',
                                                fontWeight: FontWeight.w400,
                                                height: 2,
                                              ),
                                            ),
                                            const SizedBox(height: 7),
                                            const Text(
                                              'Your trusted property buying partner',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFF6A7282),
                                                fontFamily: 'Arial',
                                                fontWeight: FontWeight.w400,
                                                height: 1,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 21),
                                        // Features
                                        Column(
                                          children: [
                                            // Feature 1
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 14,
                                                  ),
                                              height: 79,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(14),
                                                border: Border.all(
                                                  color: const Color(
                                                    0xFFDCFCE7,
                                                  ),
                                                ),
                                              ),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: 49,
                                                    height: 49,
                                                    decoration: BoxDecoration(
                                                      color: Colors.green,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            14,
                                                          ),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.black
                                                              .withOpacity(0.1),
                                                          blurRadius: 6,
                                                          offset: const Offset(
                                                            0,
                                                            4,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    child: Center(
                                                      child: SvgPicture.asset(
                                                        verifyIcon,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 14),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        const Text(
                                                          '100% Verified Properties',
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color: Color(
                                                              0xFF101828,
                                                            ),
                                                            fontFamily: 'Arial',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            height: 1,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 4,
                                                        ),
                                                        const Text(
                                                          'Every property verified for legal clearance and authenticity',
                                                          style: TextStyle(
                                                            fontSize: 11,
                                                            color: Color(
                                                              0xFF4A5565,
                                                            ),
                                                            fontFamily: 'Arial',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            height: 1.27,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 14),
                                            // Feature 2
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 14,
                                                  ),
                                              height: 79,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(14),
                                                border: Border.all(
                                                  color: const Color(
                                                    0xFFDBEAFE,
                                                  ),
                                                ),
                                              ),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: 49,
                                                    height: 49,
                                                    decoration: BoxDecoration(
                                                      color: Colors.blueAccent,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            14,
                                                          ),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.black
                                                              .withOpacity(0.1),
                                                          blurRadius: 6,
                                                          offset: const Offset(
                                                            0,
                                                            4,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    child: Center(
                                                      child: SvgPicture.asset(
                                                        smartIcon,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 14),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        const Text(
                                                          'Smart Property Matching',
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color: Color(
                                                              0xFF101828,
                                                            ),
                                                            fontFamily: 'Arial',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            height: 1,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 4,
                                                        ),
                                                        const Text(
                                                          'AI-powered recommendations based on your preferences',
                                                          style: TextStyle(
                                                            fontSize: 11,
                                                            color: Color(
                                                              0xFF4A5565,
                                                            ),
                                                            fontFamily: 'Arial',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            height: 1.27,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 14),
                                            // Feature 3
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 14,
                                                  ),
                                              height: 79,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(14),
                                                border: Border.all(
                                                  color: const Color(
                                                    0xFFF3E8FF,
                                                  ),
                                                ),
                                              ),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: 49,
                                                    height: 49,
                                                    decoration: BoxDecoration(
                                                      color: Colors.purple,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            14,
                                                          ),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.black
                                                              .withOpacity(0.1),
                                                          blurRadius: 6,
                                                          offset: const Offset(
                                                            0,
                                                            4,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    child: Center(
                                                      child: SvgPicture.asset(
                                                        expertIcon,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 14),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        const Text(
                                                          'Expert Buying Support',
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            color: Color(
                                                              0xFF101828,
                                                            ),
                                                            fontFamily: 'Arial',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            height: 1,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 4,
                                                        ),
                                                        const Text(
                                                          'Dedicated assistance from search to final registration',
                                                          style: TextStyle(
                                                            fontSize: 11,
                                                            color: Color(
                                                              0xFF4A5565,
                                                            ),
                                                            fontFamily: 'Arial',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            height: 1.27,
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
                                        const SizedBox(height: 21),
                                        // Statistics
                                        Container(
                                          padding: const EdgeInsets.only(
                                            top: 21,
                                          ),
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              top: BorderSide(
                                                color: Color(0xFFF3F4F6),
                                              ),
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Column(
                                                children: [
                                                  const Text(
                                                    '8000+',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Color(0xFF101828),
                                                      fontFamily: 'Arial',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 1,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 4),
                                                  const Text(
                                                    'Happy Buyers',
                                                    style: TextStyle(
                                                      fontSize: 11,
                                                      color: Color(0xFF6A7282),
                                                      fontFamily: 'Arial',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 1,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(width: 21),
                                              Container(
                                                width: 1,
                                                height: 28,
                                                color: const Color(0xFFE5E7EB),
                                              ),
                                              const SizedBox(width: 21),
                                              Column(
                                                children: [
                                                  const Text(
                                                    '95%',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: Color(0xFF101828),
                                                      fontFamily: 'Arial',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 1,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 4),
                                                  const Text(
                                                    'Satisfaction Rate',
                                                    style: TextStyle(
                                                      fontSize: 11,
                                                      color: Color(0xFF6A7282),
                                                      fontFamily: 'Arial',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 1,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(width: 21),
                                              Container(
                                                width: 1,
                                                height: 28,
                                                color: const Color(0xFFE5E7EB),
                                              ),
                                              const SizedBox(width: 21),
                                              Expanded(
                                                child: Column(
                                                  children: [
                                                    const Text(
                                                      '4.8',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: Color(
                                                          0xFF101828,
                                                        ),
                                                        fontFamily: 'Arial',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height: 1,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 4),
                                                    const Text(
                                                      'User Rating',
                                                      style: TextStyle(
                                                        fontSize: 11,
                                                        color: Color(
                                                          0xFF6A7282,
                                                        ),
                                                        fontFamily: 'Arial',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height: 1,
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
                                  // News Section
                                  Container(
                                    margin: const EdgeInsets.only(top: 21),
                                    padding: const EdgeInsets.fromLTRB(
                                      14,
                                      21,
                                      14,
                                      0,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              'Latest Real Estate News & Updates',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Color(0xFF101828),
                                                fontFamily: 'Arial',
                                                fontWeight: FontWeight.w400,
                                                height: 2,
                                              ),
                                            ),
                                            Container(
                                              height: 28,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 11,
                                                  ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(7),
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  'View All',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Color(0xFF155DFC),
                                                    fontFamily: 'Arial',
                                                    fontWeight: FontWeight.w400,
                                                    height: 1,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 14),
                                        // News Card 1
                                        Container(
                                          padding: const EdgeInsets.fromLTRB(
                                            14,
                                            15,
                                            0,
                                            15,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              13,
                                            ),
                                            color: Colors.white,
                                            border: Border.all(
                                              color: Colors.black.withOpacity(
                                                0.1,
                                              ),
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 56,
                                                height: 56,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(9),
                                                  color: const Color(
                                                    0xFFDBEAFE,
                                                  ),
                                                ),
                                                child: Center(
                                                  child: SvgPicture.asset(
                                                    uparrowIcon,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 14),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      'Property Prices Rise 8% in Chennai',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: Color(
                                                          0xFF101828,
                                                        ),
                                                        fontFamily: 'Arial',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height: 1,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 4),
                                                    const Text(
                                                      'Market analysis shows steady growth in residential sector...',
                                                      style: TextStyle(
                                                        fontSize: 11,
                                                        color: Color(
                                                          0xFF4A5565,
                                                        ),
                                                        fontFamily: 'Arial',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height: 1.27,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 4),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        const Text(
                                                          '2 hours ago',
                                                          style: TextStyle(
                                                            fontSize: 11,
                                                            color: Color(
                                                              0xFF6A7282,
                                                            ),
                                                            fontFamily: 'Arial',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            height: 1,
                                                          ),
                                                        ),
                                                        Container(
                                                          height: 28,
                                                          padding:
                                                              const EdgeInsets.fromLTRB(
                                                                11,
                                                                0,
                                                                10,
                                                                0,
                                                              ),
                                                          margin:
                                                              const EdgeInsets.only(
                                                                right: 14,
                                                              ),
                                                          decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  7,
                                                                ),
                                                          ),
                                                          child: const Center(
                                                            child: Text(
                                                              'Read More',
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                color: Color(
                                                                  0xFF155DFC,
                                                                ),
                                                                fontFamily:
                                                                    'Arial',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                height: 1,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 14),
                                        // News Card 2
                                        Container(
                                          padding: const EdgeInsets.fromLTRB(
                                            14,
                                            15,
                                            0,
                                            15,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              13,
                                            ),
                                            color: Colors.white,
                                            border: Border.all(
                                              color: Colors.black.withOpacity(
                                                0.1,
                                              ),
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 56,
                                                height: 56,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(9),
                                                  color: const Color(
                                                    0xFFDCFCE7,
                                                  ),
                                                ),
                                                child: Center(
                                                  child: SvgPicture.asset(
                                                    badgeIcon,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 14),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      'New Metro Line Boosts Property Values',
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        color: Color(
                                                          0xFF101828,
                                                        ),
                                                        fontFamily: 'Arial',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height: 1,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 4),
                                                    const Text(
                                                      'OMR corridor sees 15% appreciation after metro announcement...',
                                                      style: TextStyle(
                                                        fontSize: 11,
                                                        color: Color(
                                                          0xFF4A5565,
                                                        ),
                                                        fontFamily: 'Arial',
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height: 1.27,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 4),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        const Text(
                                                          '1 day ago',
                                                          style: TextStyle(
                                                            fontSize: 11,
                                                            color: Color(
                                                              0xFF6A7282,
                                                            ),
                                                            fontFamily: 'Arial',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            height: 1,
                                                          ),
                                                        ),
                                                        Container(
                                                          height: 28,
                                                          padding:
                                                              const EdgeInsets.fromLTRB(
                                                                11,
                                                                0,
                                                                10,
                                                                0,
                                                              ),
                                                          margin:
                                                              const EdgeInsets.only(
                                                                right: 14,
                                                              ),
                                                          decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  7,
                                                                ),
                                                          ),
                                                          child: const Center(
                                                            child: Text(
                                                              'Read More',
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                color: Color(
                                                                  0xFF155DFC,
                                                                ),
                                                                fontFamily:
                                                                    'Arial',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                height: 1,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
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
                                  // Help Section
                                  Container(
                                    margin: const EdgeInsets.only(top: 14),
                                    constraints: const BoxConstraints(
                                      maxWidth: 349,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(13),
                                      border: Border.all(
                                        color: Colors.black.withOpacity(0.1),
                                      ),
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0xFF1E40AF),
                                          Color(0xFF3B82F6),
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                        14,
                                        14,
                                        14,
                                        0,
                                      ),
                                      child: Column(
                                        children: [
                                          Column(
                                            children: [
                                              const Text(
                                                'Need Help?',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontFamily: 'Arial',
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              const SizedBox(height: 7),
                                              const Text(
                                                'Our experts are here to assist you',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color(0xFFDBEAFE),
                                                  fontFamily: 'Arial',
                                                  fontWeight: FontWeight.w400,
                                                  height: 1,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 14),
                                          Container(
                                            width: double.infinity,
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 5,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                              color: Colors.white.withOpacity(
                                                0.2,
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(chatIcon),
                                                const SizedBox(width: 12),
                                                const Text(
                                                  'Chat',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.white,
                                                    fontFamily: 'Arial',
                                                    fontWeight: FontWeight.w400,
                                                    height: 1,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 14),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Expanded(
                            child: SingleChildScrollView(
                              child: ExchangeScreen(),
                            ),
                          ),
                  ],
                ),
              ),
            ),
            // Bottom Navigation
            bottomNavigationBar: Container(
              height: 71,
              padding: const EdgeInsets.fromLTRB(14, 8, 14, 0),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(color: Color(0xFFE5E7EB))),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(27, 7, 27, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        SvgPicture.asset(homeIcon),
                        const Text(
                          'Home',
                          style: TextStyle(
                            fontSize: 11,
                            color: Color(0xFF155DFC),
                            fontFamily: 'Arial',
                            fontWeight: FontWeight.w400,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Image.asset(exploreIcon),
                        const Text(
                          'Explore',
                          style: TextStyle(
                            fontSize: 11,
                            color: Color(0xFF6A7282),
                            fontFamily: 'Arial',
                            fontWeight: FontWeight.w400,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SvgPicture.asset(mywishIcon),
                        const Text(
                          'My Wish',
                          style: TextStyle(
                            fontSize: 11,
                            color: Color(0xFF6A7282),
                            fontFamily: 'Arial',
                            fontWeight: FontWeight.w400,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SvgPicture.asset(profileIcon),
                        const Text(
                          'Profile',
                          style: TextStyle(
                            fontSize: 11,
                            color: Color(0xFF6A7282),
                            fontFamily: 'Arial',
                            fontWeight: FontWeight.w400,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
