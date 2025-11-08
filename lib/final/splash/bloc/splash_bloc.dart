import 'package:buildglory/final/splash/bloc/splash_event.dart';
import 'package:buildglory/final/splash/bloc/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitialState()) {
    on<NavigateEvent>(onnavigate);
    on<GetSharedPreferenceEvent>(getsharedpreference);
  }

  getsharedpreference(
    GetSharedPreferenceEvent event,
    Emitter<SplashState> emit,
  ) async {
    emit(SplashLoadingState());
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    final token = prefs.getString('token') ?? "";
    emit(GetsharedPreferenceSuccessState(isloggedin: isLoggedIn, token: token));
  }

  onnavigate(NavigateEvent event, Emitter<SplashState> emit) {
    emit(SplashLoadingState());
    emit(NavigateSuccessState());
  }
}
