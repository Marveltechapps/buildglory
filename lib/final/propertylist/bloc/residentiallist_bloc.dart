import 'package:buildglory/constant/constant.dart';
import 'package:buildglory/final/propertylist/bloc/residentiallist_event.dart';
import 'package:buildglory/final/propertylist/bloc/residentiallist_state.dart';
import 'package:buildglory/final/propertylist/model/property_list_response_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class ResidentiallistBloc
    extends Bloc<ResidentiallistEvent, ResidentiallistState> {
  ResidentiallistBloc() : super(ResidentialListInitialState()) {
    on<GetPropertyListApiEvent>(getpropertylist);
  }

  List<PropertyListResponseModel> propertylist = [];

  getpropertylist(
    GetPropertyListApiEvent event,
    Emitter<ResidentiallistState> emit,
  ) async {
    emit(ResidentialListLoadingState());
    try {
      String url = "${baseUrl}api/homepage?type=${event.propertytitle}";
      debugPrint(url);
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        debugPrint(response.body);
        var propertyListResponseModel = propertyListResponseModelFromJson(
          response.body,
        );
        emit(
          ResidentialListApiSuccessState(
            propertyListResponseModel: propertyListResponseModel,
          ),
        );
      } else {
        emit(ResidentialListErrorState(errorMsg: "Failed to fetch data"));
      }
    } catch (e) {
      emit(ResidentialListErrorState(errorMsg: "Error"));
    }
  }
}
