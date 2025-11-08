import 'package:buildglory/constant/constant.dart';
import 'package:buildglory/final/sell/bloc/sell_property_event.dart';
import 'package:buildglory/final/sell/bloc/sell_property_state.dart';
import 'package:buildglory/final/sell/model/sell_property_save_response_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class SellPropertyBloc extends Bloc<SellPropertyEvent, SellPropertyState> {
  SellPropertyBloc() : super(SellInitialState()) {
    on<SellPropertySaveEvent>(savesellpropertyapi);
    on<SelectOptionsEvent>(selectvalue);
    on<NavigateNextScreenEvent>(navigatenextscreen);
  }

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
  List<String> amenities = [
    'Swimming Pool',
    'Gym',
    'Parking',
    'Security',
    'Power Backup',
    'Lift',
    'Garden',
    'Playground',
    'Clubhouse',
    'Maintenance',
    'Water Supply',
    'Intercom',
  ];
  String propertyDescription = '';
  String fullName = '';
  String mobileNumber = '';
  String emailAddress = '';
  bool termsandconditon = false;
  List<String> amenitiesSelectedList = [];

  // static Map<String, bool> amenities = {
  //   'Swimming Pool': false,
  //   'Gym': false,
  //   'Parking': false,
  //   'Security': false,
  //   'Power Backup': false,
  //   'Lift': false,
  //   'Garden': false,
  //   'Playground': false,
  //   'Clubhouse': false,
  //   'Maintenance': false,
  //   'Water Supply': false,
  //   'Intercom': false,
  // };

  navigatenextscreen(
    NavigateNextScreenEvent event,
    Emitter<SellPropertyState> emit,
  ) {
    emit(SellLoadingState());
    emit(NavigateNextScreenState(screenName: event.screenName));
  }

  selectvalue(SelectOptionsEvent event, Emitter<SellPropertyState> emit) {
    emit(SellLoadingState());
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
    try {
      String url = "${baseUrl}api/sells";
      debugPrint("POST => $url");

      var headers = {'Authorization': 'Bearer $token'};
      debugPrint("Headers => $headers");

      var request = http.MultipartRequest('POST', Uri.parse(url));

      request.fields.addAll({
        'advertisementType': 'Sale',
        'propertyType': 'Apartment',
        'bhkType': '2 BHK',
        'builtUpArea': '1000',
        'carpetArea': '850',
        'location[city]': 'Chennai',
        'location[locality]': 'Guindy',
        'location[projectName]': 'Green Heights',
        'price': '35000000',
        'isNegotiable': 'true',
        'ageOfConstruction': '0-5 years',
        'facing': 'East',
        'ownership': 'Freehold',
        'furnishedStatus': 'Fully Furnished',
        'description': 'Spacious 2BHK apartment with excellent connectivity.',
        'locationMapLink': 'https://maps.google.com/?q=Green+Heights+Guindy',
      });

      // ✅ Add amenities as a list (same key multiple times)
      final amenities = ['Gym', 'Pool', 'Lift', 'Security'];
      for (var amenity in amenities) {
        request.fields['amenities[]'] = amenity;
      }

      // ✅ Image file
      // request.files.add(await http.MultipartFile.fromPath('images', ''));

      request.headers.addAll(headers);

      // ✅ Send the request
      final response = await request.send();

      if (response.statusCode == 200 || response.statusCode == 201) {
        final respStr = await response.stream.bytesToString();
        debugPrint("Response: $respStr");
        emit(
          SellPropertySaveSuccessState(
            sellPropertySaveResponseModel:
                sellPropertySaveResponseModelFromJson(respStr),
          ),
        );
      } else {
        debugPrint("Error: ${response.statusCode} - ${response.reasonPhrase}");
        emit(
          SellErrorState(errorMsg: response.reasonPhrase ?? 'Unknown error'),
        );
      }
    } catch (e) {
      debugPrint("Exception: $e");
      emit(SellErrorState(errorMsg: e.toString()));
    }
  }
}
