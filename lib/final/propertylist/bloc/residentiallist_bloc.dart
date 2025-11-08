import 'package:buildglory/constant/constant.dart';
import 'package:buildglory/final/propertylist/bloc/residentiallist_event.dart';
import 'package:buildglory/final/propertylist/bloc/residentiallist_state.dart';
import 'package:buildglory/final/propertylist/model/property_list_response_mode.dart';
import 'package:buildglory/final/propertylist/repository/property_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResidentiallistBloc
    extends Bloc<ResidentiallistEvent, ResidentiallistState> {
  ResidentiallistBloc({PropertyRepository? propertyRepository})
      : _repository = propertyRepository ?? PropertyRepository(),
        super(ResidentialListInitialState()) {
    on<GetPropertyListApiEvent>(getpropertylist);
  }

  final PropertyRepository _repository;

  List<PropertyListResponseModel> propertylist = [];

  getpropertylist(
    GetPropertyListApiEvent event,
    Emitter<ResidentiallistState> emit,
  ) async {
    emit(ResidentialListLoadingState());
    try {
      final propertyListResponseModel = await _repository.fetchHomepageProperties(
        type: event.propertytitle,
      );
      emit(
        ResidentialListApiSuccessState(
          propertyListResponseModel: propertyListResponseModel,
        ),
      );
    } catch (error) {
      emit(
        ResidentialListErrorState(
          errorMsg: error.toString().replaceAll('Exception: ', ''),
        ),
      );
    }
  }
}
