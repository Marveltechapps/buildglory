import 'package:buildglory/final/sell/bloc/sell_property_event.dart';
import 'package:buildglory/final/sell/bloc/sell_property_state.dart';
import 'package:buildglory/final/sell/model/sell_property_save_response_mode.dart';
import 'package:buildglory/final/sell/repository/sell_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SellPropertyBloc extends Bloc<SellPropertyEvent, SellPropertyState> {
  SellPropertyBloc({SellRepository? sellRepository})
      : _sellRepository = sellRepository ?? SellRepository(),
        super(SellInitialState()) {
    on<SellPropertySaveEvent>(savesellpropertyapi);
    on<SelectOptionsEvent>(selectvalue);
  }

  final SellRepository _sellRepository;

  String selectedAdvertisementType = '';
  String selectedPropertyType = '';
  String selectedBhkType = '';
  String buildUpArea = '';
  String carpetArea = '';
  String selectedCity = '';
  String locality = '';
  String project = '';
  String expectedPrice = '';
  bool priceNegotiable = false;
  String ageOfConstrution = '';
  String facing = '';
  String ownership = '';
  String furnishedStatus = '';
  List<String> amenities = [];
  String propertyDescription = '';
  String fullName = '';
  String mobileNumber = '';
  String emailAddress = '';
  bool termsandconditon = false;
  String locationMapLink = '';

  selectvalue(SelectOptionsEvent event, Emitter<SellPropertyState> emit) {
    emit(SellLoadingState());
    if (event.title.contains('Property Advertisement')) {
      selectedAdvertisementType = event.selectedValue;
    } else if (event.title.contains('Property Type')) {
      selectedPropertyType = event.selectedValue;
    } else if (event.title.contains('BHK')) {
      selectedBhkType = event.selectedValue;
    } else if (event.title.contains('City')) {
      selectedCity = event.selectedValue;
    } else if (event.title == 'Terms') {
      termsandconditon = event.selectedValue.toLowerCase() == 'true';
    }
    emit(
      SelectedOptionSuccessState(
        title: event.title,
        selectedValue: event.selectedValue,
      ),
    );
  }

  Future<void> savesellpropertyapi(
    SellPropertySaveEvent event,
    Emitter<SellPropertyState> emit,
  ) async {
    emit(SellLoadingState());
    try {
      final fields = _buildRequestFields();
      final response = await _sellRepository.createSellListing(
        fields: fields,
        amenities: amenities,
      );

      emit(
        SellPropertySaveSuccessState(
          sellPropertySaveResponseModel: response,
        ),
      );
    } catch (error) {
      emit(
        SellErrorState(
          errorMsg: error.toString().replaceAll('Exception: ', ''),
        ),
      );
    }
  }

  Map<String, String> _buildRequestFields() {
    String fallback(String value, String fallbackValue) =>
        value.isNotEmpty ? value : fallbackValue;

    final fields = <String, String>{
      'advertisementType': fallback(selectedAdvertisementType, 'Sale'),
      'propertyType': fallback(selectedPropertyType, 'Apartment'),
      'bhkType': fallback(selectedBhkType, '2 BHK'),
      'builtUpArea': fallback(buildUpArea, '0'),
      'carpetArea': fallback(carpetArea, '0'),
      'price': fallback(expectedPrice, '0'),
      'isNegotiable': priceNegotiable.toString(),
    };

    void putIfNotEmpty(String key, String value) {
      if (value.isNotEmpty) {
        fields[key] = value;
      }
    }

    putIfNotEmpty('location[city]', selectedCity);
    putIfNotEmpty('location[locality]', locality);
    putIfNotEmpty('location[projectName]', project);
    putIfNotEmpty('ageOfConstruction', ageOfConstrution);
    putIfNotEmpty('facing', facing);
    putIfNotEmpty('ownership', ownership);
    putIfNotEmpty('furnishedStatus', furnishedStatus);
    putIfNotEmpty('description', propertyDescription);
    putIfNotEmpty('locationMapLink', locationMapLink);
    putIfNotEmpty('contactName', fullName);
    putIfNotEmpty('contactNumber', mobileNumber);
    putIfNotEmpty('contactEmail', emailAddress);

    return fields;
  }
}
