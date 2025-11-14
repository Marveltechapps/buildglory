abstract class SellPropertyEvent {}

class SelectOptionsEvent extends SellPropertyEvent {
  final String title;
  final String selectedValue;

  SelectOptionsEvent({required this.title, required this.selectedValue});
}

class SellPropertySaveEvent extends SellPropertyEvent {}

class NavigateNextScreenEvent extends SellPropertyEvent {
  final String screenName;

  NavigateNextScreenEvent({required this.screenName});
}

class ClearSellPropertyDataEvent extends SellPropertyEvent {}
