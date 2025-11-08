abstract class SplashState {}

class SplashInitialState extends SplashState {}

class SplashLoadingState extends SplashState {}

class NavigateSuccessState extends SplashState {}

class GetsharedPreferenceSuccessState extends SplashState {
  final bool isloggedin;
  final String token;

  GetsharedPreferenceSuccessState({
    required this.isloggedin,
    required this.token,
  });
}
