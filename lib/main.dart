import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'generated/bloc/bloc_provider_setup.dart';
import 'generated/bloc/bloc_exports.dart';
import 'generated/screens_bloc/home_screen_bloc.dart';
import 'generated/widgets_bloc/auth_bloc_widgets.dart';
import 'final/splash/pages/splash_screen.dart';

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
class SplashScreenWrapper extends StatefulWidget {
  const SplashScreenWrapper({super.key});

  @override
  State<SplashScreenWrapper> createState() => _SplashScreenWrapperState();
}

class _SplashScreenWrapperState extends State<SplashScreenWrapper> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    // Wait for 2 seconds (splash screen duration)
    await Future.delayed(const Duration(seconds: 2));
    
    if (mounted) {
      // Check authentication status
      final authBloc = context.read<AuthBloc>();
      final authState = authBloc.state;
      
      if (authState is Authenticated) {
        // User is logged in, go to home
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const HomeScreenBloc()),
        );
      } else {
        // User not logged in, go to onboarding/login
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const LoginScreenWrapper()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Use your existing splash screen
    return const SplashScreen();
  }
}

/// Login Screen Wrapper
class LoginScreenWrapper extends StatelessWidget {
  const LoginScreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: OTPLoginBlocWidget(
          onSuccess: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const HomeScreenBloc()),
            );
          },
        ),
      ),
    );
  }
}
