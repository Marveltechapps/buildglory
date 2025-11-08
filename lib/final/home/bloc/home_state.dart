abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeErrorState extends HomeState {
  final String errorMsg;

  HomeErrorState({required this.errorMsg});
}

class SelectedTypeSuccessState extends HomeState {
  final String title;

  SelectedTypeSuccessState({required this.title});
}

class SelectedIndexState extends HomeState {
  final int selectedIndex;

  SelectedIndexState({required this.selectedIndex});
}
