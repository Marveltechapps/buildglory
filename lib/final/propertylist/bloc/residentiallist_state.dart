import 'package:buildglory/final/propertylist/model/property_list_response_mode.dart';

abstract class ResidentiallistState {}

class ResidentialListInitialState extends ResidentiallistState {}

class ResidentialListLoadingState extends ResidentiallistState {}

class ResidentialListErrorState extends ResidentiallistState {
  final String errorMsg;

  ResidentialListErrorState({required this.errorMsg});
}

class ResidentialListApiSuccessState extends ResidentiallistState {
  final List<PropertyListResponseModel> propertyListResponseModel;

  ResidentialListApiSuccessState({required this.propertyListResponseModel});
}
