abstract class SellPropertyEvent {}

class SelectOptionsEvent extends SellPropertyEvent {
  final String title;
  final String selectedValue;

  SelectOptionsEvent({required this.title, required this.selectedValue});
}

class SellPropertySaveEvent extends SellPropertyEvent {}
