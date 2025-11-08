import 'package:buildglory/constant/constant.dart';
import 'package:buildglory/final/home/bloc/home_bloc.dart';
import 'package:buildglory/final/home/bloc/home_event.dart';
import 'package:buildglory/final/home/bloc/home_state.dart';
import 'package:buildglory/final/home/pages/home_screen.dart';
import 'package:buildglory/new/presentation/explore/widgets/explore_page.dart';
import 'package:buildglory/new/presentation/profile/widgets/profile_page.dart';
import 'package:buildglory/new/presentation/wish/wish_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeMainScreen extends StatelessWidget {
  const HomeMainScreen({super.key});

  static List<Widget> screens = [
    HomeScreen(),
    ExplorePage(),
    WishScreen(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is SelectedIndexState) {
            selectedIndex = state.selectedIndex;
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: screens[selectedIndex],
            bottomNavigationBar: BottomAppBar(
              color: Colors.white,
              shape: CircularNotchedRectangle(),
              //  elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Home Button
                    GestureDetector(
                      onTap: () {
                        context.read<HomeBloc>().add(
                          NavigateEvent(selectedIndex: 0),
                        );
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            homeblackIcon,
                            color: selectedIndex == 0 ? blueColor : null,
                            height: 20,
                          ),
                          Text(
                            "Home",
                            style: TextStyle(
                              color: selectedIndex == 0 ? blueColor : null,
                              fontSize: 14,
                              // fontWeight: selectedIndex == 0
                              //     ? FontWeight.bold
                              //     : null,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Categories Button
                    GestureDetector(
                      onTap: () {
                        context.read<HomeBloc>().add(
                          NavigateEvent(selectedIndex: 1),
                        );
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            explorebIcon,
                            color: selectedIndex == 1 ? blueColor : null,
                            height: 20,
                          ),
                          Text(
                            "Explore",
                            style: TextStyle(
                              color: selectedIndex == 1 ? blueColor : null,
                              fontSize: 14,
                              // fontWeight: selectedIndex == 1
                              //     ? FontWeight.bold
                              //     : null,
                            ),
                          ),
                        ],
                      ),
                    ),

                    GestureDetector(
                      onTap: () async {
                        context.read<HomeBloc>().add(
                          NavigateEvent(selectedIndex: 2),
                        );
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            wishbIcon,
                            color: selectedIndex == 2 ? blueColor : null,
                            height: 20,
                          ),
                          Text(
                            "My Wish",
                            style: TextStyle(
                              color: selectedIndex == 2 ? blueColor : null,
                              fontSize: 14,
                              // fontWeight: selectedIndex == 2
                              //     ? FontWeight.bold
                              //     : null,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        context.read<HomeBloc>().add(
                          NavigateEvent(selectedIndex: 3),
                        );
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            profilebIcon,
                            color: selectedIndex == 3 ? blueColor : null,
                            height: 20,
                          ),
                          Text(
                            "Profile",
                            style: TextStyle(
                              color: selectedIndex == 3 ? blueColor : null,
                              fontSize: 14,
                              // fontWeight: selectedIndex == 2
                              //     ? FontWeight.bold
                              //     : null,
                            ),
                          ),
                        ],
                      ),
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
