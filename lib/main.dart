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
    // Wait for splash screen duration + auth check
    await Future.delayed(const Duration(seconds: 2));
    
    if (!mounted) return;

    final authBloc = context.read<AuthBloc>();
    
    // Wait for auth state to be determined (not loading)
    await Future.delayed(const Duration(milliseconds: 500));
    
    if (!mounted) return;

    // Listen to auth state changes
    final subscription = authBloc.stream.listen((state) {
      if (!mounted) return;

      if (state is Authenticated) {
        // User is logged in, go to YOUR home screen
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
      } else if (state is Unauthenticated || state is AuthError) {
        // User not logged in, go to YOUR login screen
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const LoginScreen()),
        );
      }
    });

    // Check current state immediately
    final currentState = authBloc.state;
    if (currentState is Authenticated) {
      subscription.cancel();
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
      }
    } else if (currentState is Unauthenticated || currentState is AuthError) {
      subscription.cancel();
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const LoginScreen()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Use YOUR existing splash screen
    return const SplashScreen();
  }
}
