import 'package:buildglory/constant/constant.dart';
import 'package:buildglory/final/onboard/bloc/onboard_bloc.dart';
import 'package:buildglory/final/onboard/bloc/onboard_event.dart';
import 'package:buildglory/final/onboard/bloc/onboard_state.dart';
import 'package:buildglory/final/onboard/model/onboard_model.dart';
import 'package:buildglory/final/widgets/submit_button_widget.dart';
import 'package:buildglory/final/login/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardScreen extends StatelessWidget {
  OnboardScreen({super.key});

  final PageController pageController = PageController();
  static int currentIndex = 0;
  static List<OnboardModel> onboardList = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardBloc(),
      child: BlocConsumer<OnboardBloc, OnboardState>(
        listener: (context, state) {
          if (state is OnboardDataSuccessState) {
            onboardList = state.onboardList;
          } else if (state is OnboardApiDataSuccessState) {
            context.read<OnboardBloc>().onboardResponseModel =
                state.onboardResponseModel;
          } else if (state is NextSlideSuccessState) {
            currentIndex = state.index;
          }
        },
        builder: (context, state) {
          if (state is OnboardInitialState) {
            context.read<OnboardBloc>().add(GetOnboardDateEvent());
            context.read<OnboardBloc>().add(GetOnboardDataFormApiEvent());
          }
          return PopScope(
            canPop: false,
            child: Scaffold(
              backgroundColor: Colors.white,
              body: SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child:
                          context
                              .read<OnboardBloc>()
                              .onboardResponseModel
                              .isEmpty
                          ? SizedBox()
                          : PageView.builder(
                              controller: pageController,
                              itemCount: onboardList.length,
                              onPageChanged: (index) {
                                context.read<OnboardBloc>().add(
                                  NextSlideEvent(index: index),
                                );
                              },
                              itemBuilder: (context, index) {
                                final data = context
                                    .read<OnboardBloc>()
                                    .onboardResponseModel[index];
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Image.network(
                                        data.imageUrl ?? "",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        spacing: 16,
                                        children: [
                                          Text(
                                            data.title ?? "",
                                            style: const TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          Text(
                                            data.description ?? "",
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black87,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                    ),

                    // Dots Indicator
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(onboardList.length, (index) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          height: 8,
                          width: currentIndex == index ? 20 : 8,
                          decoration: BoxDecoration(
                            color: currentIndex == index
                                ? blueColor
                                : Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 20),

                    // Next / Get Started button
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(
                    //     horizontal: 24,
                    //     vertical: 30,
                    //   ),
                    //   child: SizedBox(
                    //     height: 40,
                    //     child: ElevatedButton(
                    //       onPressed: () {
                    //         if (currentIndex == onboardList.length - 1) {
                    //           Navigator.push(
                    //             context,
                    //             MaterialPageRoute(
                    //               builder: (context) {
                    //                 return LoginScreen();
                    //               },
                    //             ),
                    //           );
                    //         } else {
                    //           pageController.nextPage(
                    //             duration: const Duration(milliseconds: 400),
                    //             curve: Curves.easeInOut,
                    //           );
                    //         }
                    //       },
                    //       style: ElevatedButton.styleFrom(
                    //         minimumSize: const Size(double.infinity, 55),
                    //         backgroundColor: blueColor,
                    //         shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(12),
                    //         ),
                    //       ),
                    //       child: Text(
                    //         currentIndex == onboardList.length - 1
                    //             ? "Get Started"
                    //             : "Next",
                    //         style: const TextStyle(
                    //           fontSize: 18,
                    //           color: Colors.white,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    SubmitButtonWidget(
                      ontap: () {
                        if (currentIndex == onboardList.length - 1) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return LoginScreen();
                              },
                            ),
                          );
                        } else {
                          pageController.nextPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      title: "Next",
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
