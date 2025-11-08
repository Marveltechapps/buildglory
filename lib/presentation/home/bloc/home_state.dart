abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeErrorState extends HomeState {
  final String errorMessage;

  HomeErrorState({required this.errorMessage});
}

class SelectedTypeState extends HomeState {
  final String title;

  SelectedTypeState({required this.title});
}
