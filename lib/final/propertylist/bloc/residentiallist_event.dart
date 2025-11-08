abstract class ResidentiallistEvent {}

class GetPropertyListApiEvent extends ResidentiallistEvent {
  final String propertytitle;

  GetPropertyListApiEvent({required this.propertytitle});
}
