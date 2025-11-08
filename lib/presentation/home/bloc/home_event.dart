abstract class HomeEvent {}

class SelectTypeEvent extends HomeEvent {
  final String title;

  SelectTypeEvent({required this.title});
}
