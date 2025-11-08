import 'package:buildglory/new/presentation/home/bloc/home_event.dart';
import 'package:buildglory/new/presentation/home/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<OnSelectTypeEvent>(onselecttype);
    on<NavigateEvent>(onnavigatescreen);
  }

  onselecttype(OnSelectTypeEvent event, Emitter<HomeState> emit) {
    emit(HomeLoadingState());
    emit(SelectedTypeSuccessState(title: event.title));
  }

  onnavigatescreen(NavigateEvent event, Emitter<HomeState> emit) {
    emit(HomeLoadingState());
    emit(SelectedIndexState(selectedIndex: event.selectedIndex));
  }
}
