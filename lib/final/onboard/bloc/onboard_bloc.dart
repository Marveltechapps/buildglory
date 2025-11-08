import 'package:buildglory/constant/constant.dart';
import 'package:buildglory/final/onboard/bloc/onboard_event.dart';
import 'package:buildglory/final/onboard/bloc/onboard_state.dart';
import 'package:buildglory/final/onboard/model/onboard_model.dart';
import 'package:buildglory/final/onboard/model/onboard_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repository/onboarding_repository.dart';

class OnboardBloc extends Bloc<OnboardEvent, OnboardState> {
  OnboardBloc({OnboardingRepository? onboardingRepository})
      : _repository = onboardingRepository ?? OnboardingRepository(),
        super(OnboardInitialState()) {
    on<GetOnboardDateEvent>(getOnboarddata);
    on<NextSlideEvent>(getindex);
    on<GetOnboardDataFormApiEvent>(getdataformapi);
  }

  final OnboardingRepository _repository;

  List<OnboardModel> onboardList = [];
  List<OnboardResponseModel> onboardResponseModel = [];

  getOnboarddata(GetOnboardDateEvent event, Emitter<OnboardState> emit) {
    emit(OnboardLoadingState());
    onboardList.addAll([
      OnboardModel(
        imageString: onboardoneImage,
        title: "Discover Your Perfect Home",
        description:
            "Buy your dream home with immersive 3D tours across at comprehensive details",
      ),
      OnboardModel(
        imageString: onboardtwoImage,
        title: "Sell Your Home As it is",
        description:
            "List your home to be sold to your best quickly and easily with our simple tools",
      ),
      OnboardModel(
        imageString: onboardthreeImage,
        title: "Exchange Your Home",
        description:
            "Get new existing homes. Upgrade to any new house that ignites your lifestyle",
      ),
    ]);
    emit(OnboardDataSuccessState(onboardList: onboardList));
  }

  getdataformapi(
    GetOnboardDataFormApiEvent event,
    Emitter<OnboardState> emit,
  ) async {
    emit(OnboardLoadingState());
    try {
      final result = await _repository.fetchScreens();
      emit(OnboardApiDataSuccessState(onboardResponseModel: result));
    } catch (error) {
      emit(
        OnboardErrorState(
          errorMsg: error.toString().replaceAll('Exception: ', ''),
        ),
      );
    }
  }

  getindex(NextSlideEvent event, Emitter<OnboardState> emit) {
    emit(OnboardLoadingState());
    emit(NextSlideSuccessState(index: event.index));
  }
}
