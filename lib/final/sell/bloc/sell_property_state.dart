import 'package:buildglory/final/sell/model/sell_property_save_response_mode.dart';

abstract class SellPropertyState {}

class SellInitialState extends SellPropertyState {}

class SellLoadingState extends SellPropertyState {}

class SellErrorState extends SellPropertyState {
  final String errorMsg;

  SellErrorState({required this.errorMsg});
}

class SelectedOptionSuccessState extends SellPropertyState {
  final String title;
  final String selectedValue;

  SelectedOptionSuccessState({
    required this.title,
    required this.selectedValue,
  });
}

class SellPropertySaveSuccessState extends SellPropertyState {
  final SellPropertySaveResponseModel sellPropertySaveResponseModel;

  SellPropertySaveSuccessState({required this.sellPropertySaveResponseModel});
}
