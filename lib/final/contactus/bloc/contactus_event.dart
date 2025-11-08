abstract class ContactusEvent {}

class SaveContactDataApiEvent extends ContactusEvent {
  final String propertyId;
  final String type;
  final String message;

  SaveContactDataApiEvent({
    required this.propertyId,
    required this.type,
    required this.message,
  });
}
