import 'package:buildglory/constant/constant.dart';
import 'package:buildglory/final/home/pages/home_main_screen.dart';
import 'package:buildglory/final/login/pages/login_screen.dart';
import 'package:buildglory/generated/bloc/bloc_exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  StreamSubscription? _authSubscription;
  bool _hasNavigated = false;

  @override
  void initState() {
    super.initState();
    _checkAuthAndNavigate();
  }

  Future<void> _checkAuthAndNavigate() async {
    // Wait for splash animation (2.9 seconds as per original)
    await Future.delayed(const Duration(milliseconds: 2900));

    if (!mounted || _hasNavigated) return;

    final authBloc = context.read<AuthBloc>();

    // Listen to auth state changes
    _authSubscription = authBloc.stream.listen((state) {
      if (_hasNavigated || !mounted) return;

      if (state is Authenticated) {
        _hasNavigated = true;
        _authSubscription?.cancel();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomeMainScreen()),
        );
      } else if (state is Unauthenticated || state is AuthError) {
        _hasNavigated = true;
        _authSubscription?.cancel();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LoginScreen()),
        );
      }
    });

    // Check current state
    final currentState = authBloc.state;
    if (currentState is Authenticated) {
      if (!_hasNavigated && mounted) {
        _hasNavigated = true;
        _authSubscription?.cancel();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomeMainScreen()),
        );
      }
    } else if (currentState is Unauthenticated || currentState is AuthError) {
      if (!_hasNavigated && mounted) {
        _hasNavigated = true;
        _authSubscription?.cancel();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LoginScreen()),
        );
      }
    }
    // If state is AuthLoading, wait for the stream listener to handle it
  }

  @override
  void dispose() {
    _authSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(splashGif),
          const SizedBox(),
        ],
      ),
    );
  }
}
