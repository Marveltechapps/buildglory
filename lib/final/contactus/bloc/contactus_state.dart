import 'package:buildglory/final/contactus/model/contactus_response_model.dart';

abstract class ContactusState {}

class ContactusInitialState extends ContactusState {}

class ContactusLoadingState extends ContactusState {}

class ContactusErrorState extends ContactusState {
  final String errorMsg;

  ContactusErrorState({required this.errorMsg});
}

class ContactDataApiSuccessState extends ContactusState {
  final ContactUsResponseModel contactUsResponseModel;

  ContactDataApiSuccessState({required this.contactUsResponseModel});
}
