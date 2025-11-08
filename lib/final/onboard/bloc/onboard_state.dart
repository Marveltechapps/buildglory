import 'package:buildglory/final/onboard/model/onboard_model.dart';
import 'package:buildglory/final/onboard/model/onboard_response_model.dart';

abstract class OnboardState {}

class OnboardInitialState extends OnboardState {}

class OnboardLoadingState extends OnboardState {}

class OnboardErrorState extends OnboardState {
  final String errorMsg;

  OnboardErrorState({required this.errorMsg});
}

class OnboardDataSuccessState extends OnboardState {
  final List<OnboardModel> onboardList;

  OnboardDataSuccessState({required this.onboardList});
}

class OnboardApiDataSuccessState extends OnboardState {
  final List<OnboardResponseModel> onboardResponseModel;

  OnboardApiDataSuccessState({required this.onboardResponseModel});
}

class NextSlideSuccessState extends OnboardState {
  final int index;

  NextSlideSuccessState({required this.index});
}
