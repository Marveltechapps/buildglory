abstract class OnboardEvent {}

class GetOnboardDateEvent extends OnboardEvent {}

class NextSlideEvent extends OnboardEvent {
  final int index;

  NextSlideEvent({required this.index});
}

class GetOnboardDataFormApiEvent extends OnboardEvent{}