import 'dart:convert';

import 'package:buildglory/constant/constant.dart';
import 'package:buildglory/final/contactus/bloc/contactus_event.dart';
import 'package:buildglory/final/contactus/bloc/contactus_state.dart';
import 'package:buildglory/final/contactus/model/contactus_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:buildglory/api/apiservice.dart' as api;

class ContactusBloc extends Bloc<ContactusEvent, ContactusState> {
  ContactusBloc() : super(ContactusInitialState()) {
    on<SaveContactDataApiEvent>(savecontact);
  }

  savecontact(
    SaveContactDataApiEvent event,
    Emitter<ContactusState> emit,
  ) async {
    emit(ContactusLoadingState());
    try {
      String url = "${baseUrl}api/enquiry";
      debugPrint(url);
      api.Response response = await api.ApiService().postRequest(
        url,
        json.encode({
          "propertyId": event.propertyId,
          "type": event.type,
          "message": event.message,
        }),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        var contactUsResponseModel = contactUsResponseModelFromJson(
          response.resBody,
        );
        emit(
          ContactDataApiSuccessState(
            contactUsResponseModel: contactUsResponseModel,
          ),
        );
      } else {
        emit(ContactusErrorState(errorMsg: response.resBody));
      }
    } catch (e) {
      emit(ContactusErrorState(errorMsg: ""));
    }
  }
}
