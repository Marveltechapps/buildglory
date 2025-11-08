abstract class HomeEvent {}

class OnSelectTypeEvent extends HomeEvent {
  final String title;

  OnSelectTypeEvent({required this.title});
}

class NavigateEvent extends HomeEvent {
  final int selectedIndex;

  NavigateEvent({required this.selectedIndex});
}
