import 'package:buildglory/constant/constant.dart';
import 'package:buildglory/new/presentation/home/bloc/home_bloc.dart';
import 'package:buildglory/new/presentation/home/bloc/home_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class WishScreen extends StatelessWidget {
  const WishScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Container(
          color: const Color(0xFFFFFFFF),
          constraints: const BoxConstraints(maxWidth: 480),
          width: double.infinity,
          child: Column(
            children: [
              // Header Container
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(0xFFE5E7EB), width: 1),
                  ),
                ),
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                child: Container(
                  constraints: const BoxConstraints(minHeight: 28),
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'My Wishlist',
                    style: TextStyle(
                      color: Color(0xFF1A1A1A),
                      fontSize: 21,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Arial',
                      letterSpacing: -0.42,
                      height: 1,
                    ),
                  ),
                ),
              ),
              // Main Content Container
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Icon Container
                      Container(
                        width: 56,
                        height: 56,
                        decoration: const BoxDecoration(
                          color: Color(0xFFF3F4F6),
                          borderRadius: BorderRadius.all(
                            Radius.circular(33554400),
                          ),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            filtergreyIcon,
                            width: 28,
                            height: 28,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      // Heading
                      Container(
                        margin: const EdgeInsets.only(top: 14),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(
                                'No Saved Properties',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF102840),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Arial',
                                  letterSpacing: -0.16,
                                  height: 2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Description Paragraph
                      Text(
                        'Save properties you\'re interested in to compare them and contact agents later.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF6A7282),
                          fontSize: 12,

                          fontWeight: FontWeight.w400,
                          fontFamily: 'Arial',
                          height: 17 / 12,
                        ),
                      ),
                      // Button
                      Container(
                        margin: const EdgeInsets.only(top: 14),
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<HomeBloc>().add(
                              NavigateEvent(selectedIndex: 0),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF030213),
                            foregroundColor: const Color(0xFFFFFFFF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.fromLTRB(14, 8, 14, 8),
                            elevation: 0,
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Text(
                                  'Browse Properties',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Arial',
                                    height: 2,
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
      ),
    );
  }
}
