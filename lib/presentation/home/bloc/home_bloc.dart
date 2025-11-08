import 'package:buildglory/presentation/home/bloc/home_event.dart';
import 'package:buildglory/presentation/home/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<SelectTypeEvent>(selectType);
  }

  String selectedTypeValue = "Buy";

  selectType(SelectTypeEvent event, Emitter<HomeState> emit) {
    emit(HomeLoadingState());
    emit(SelectedTypeState(title: event.title));
  }
}
