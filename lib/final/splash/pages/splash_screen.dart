import 'package:buildglory/constant/constant.dart';
import 'package:buildglory/final/home/pages/home_main_screen.dart';
import 'package:buildglory/final/onboard/pages/onboard_screen.dart';
import 'package:buildglory/final/splash/bloc/splash_bloc.dart';
import 'package:buildglory/final/splash/bloc/splash_event.dart';
import 'package:buildglory/final/splash/bloc/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc(),
      child: BlocConsumer<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is NavigateSuccessState) {
            context.read<SplashBloc>().add(GetSharedPreferenceEvent());
          } else if (state is GetsharedPreferenceSuccessState) {
            if (state.isloggedin) {
              token = state.token;
              Future.delayed(const Duration(milliseconds: 2900), () {
                if (!context.mounted) return;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return HomeMainScreen();
                    },
                  ),
                );
              });
            } else {
              Future.delayed(const Duration(milliseconds: 2900), () {
                if (!context.mounted) return;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return OnboardScreen();
                    },
                  ),
                );
              });
            }
          }
        },
        builder: (context, state) {
          if (state is SplashInitialState) {
            context.read<SplashBloc>().add(NavigateEvent());
          }
          return Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Image.asset(splashGif), SizedBox()],
            ),
          );
        },
      ),
    );
  }
}
