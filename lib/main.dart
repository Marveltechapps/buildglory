import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'generated/bloc/bloc_provider_setup.dart';
import 'generated/bloc/bloc_exports.dart';
import 'final/splash/pages/splash_screen.dart';
import 'final/login/pages/login_screen.dart';
import 'final/home/pages/home_screen.dart';

void main() {
  // Optional: Add BLoC observer for debugging
  Bloc.observer = AppBlocObserver();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProviderSetup(
      child: MaterialApp(
        title: 'Built Glory',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.green,
            brightness: Brightness.light,
          ),
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
        ),
        home: const SplashScreenWrapper(),
      ),
    );
  }
}

/// Splash Screen Wrapper
class SplashScreenWrapper extends StatelessWidget {
  const SplashScreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    // Use YOUR existing splash screen which now handles auth navigation
    return const SplashScreen();
  }
}
