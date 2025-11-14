import 'dart:io';
import 'package:buildglory/constant/constant.dart';
import 'package:buildglory/final/sell/bloc/sell_property_event.dart';
import 'package:buildglory/final/sell/bloc/sell_property_state.dart';
import 'package:buildglory/final/sell/model/sell_property_save_response_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart' show MediaType;
import 'package:shared_preferences/shared_preferences.dart';

class SellPropertyBloc extends Bloc<SellPropertyEvent, SellPropertyState> {
  SellPropertyBloc() : super(SellInitialState()) {
    on<SellPropertySaveEvent>(savesellpropertyapi);
    on<SelectOptionsEvent>(selectvalue);
    on<NavigateNextScreenEvent>(navigatenextscreen);
    on<ClearSellPropertyDataEvent>(cleardata);
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
  List<File> selectedImages = [];

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

  cleardata(
    ClearSellPropertyDataEvent event,
    Emitter<SellPropertyState> emit,
  ) {
    // Reset all form data
    selectedAdvertisementType = '';
    selectedPropertyType = '';
    selectedBhkType = '';
    buildUpArea = '';
    carpetArea = '';
    selectedCity = '';
    locality = '';
    project = '';
    expectedPrice = '';
    priceNegotiable = false;
    ageOfConstrution = '';
    facing = '';
    ownership = '';
    furnishedStatus = '';
    propertyDescription = '';
    fullName = '';
    mobileNumber = '';
    emailAddress = '';
    termsandconditon = false;
    amenitiesSelectedList.clear();
    selectedImages.clear();

    debugPrint("🧹 All sell property data cleared");
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
      emit(SellLoadingState());

      // Get token from SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      final authToken = prefs.getString('token') ?? '';
      final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

      debugPrint("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
      debugPrint("🔐 AUTHENTICATION CHECK:");
      debugPrint("  isLoggedIn: $isLoggedIn");
      debugPrint("  Token exists: ${authToken.isNotEmpty}");
      if (authToken.isNotEmpty) {
        debugPrint(
            "  Token preview: ${authToken.substring(0, authToken.length > 20 ? 20 : authToken.length)}...");
      }
      debugPrint("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");

      if (authToken.isEmpty) {
        debugPrint("❌ ERROR: No authentication token found!");
        emit(SellErrorState(
            errorMsg: 'Authentication token not found. Please login again.'));
        return;
      }

      String url = "${baseUrl}api/sells";
      debugPrint("📡 API CALL:");
      debugPrint("  URL: $url");

      var headers = {'Authorization': 'Bearer $authToken'};
      debugPrint(
          "  Headers: Authorization = Bearer ${authToken.substring(0, 20)}...");

      var request = http.MultipartRequest('POST', Uri.parse(url));

      // ✅ Using dynamic values from the form fields
      request.fields.addAll({
        'advertisementType': selectedAdvertisementType.isNotEmpty
            ? selectedAdvertisementType
            : 'Sale',
        'propertyType': selectedPropertyType.isNotEmpty
            ? selectedPropertyType
            : 'Apartment',
        'bhkType': selectedBhkType.isNotEmpty ? selectedBhkType : '2 BHK',
        'builtUpArea': buildUpArea.isNotEmpty ? buildUpArea : '0',
        'carpetArea': carpetArea.isNotEmpty ? carpetArea : '0',
        'location[city]': selectedCity.isNotEmpty ? selectedCity : '',
        'location[locality]': locality.isNotEmpty ? locality : '',
        'location[projectName]': project.isNotEmpty ? project : '',
        'price': expectedPrice.isNotEmpty ? expectedPrice : '0',
        'isNegotiable': priceNegotiable.toString(),
        'ageOfConstruction':
            ageOfConstrution.isNotEmpty ? ageOfConstrution : '',
        'facing': facing.isNotEmpty ? facing : '',
        'ownership': ownership.isNotEmpty ? ownership : '',
        'furnishedStatus': furnishedStatus.isNotEmpty ? furnishedStatus : '',
        'description':
            propertyDescription.isNotEmpty ? propertyDescription : '',
        'locationMapLink': '',
      });

      debugPrint("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");
      debugPrint("📝 REQUEST FIELDS:");
      request.fields.forEach((key, value) {
        debugPrint("  $key: $value");
      });
      debugPrint("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");

      // ✅ Add selected amenities dynamically
      for (var amenity in amenitiesSelectedList) {
        request.fields['amenities[]'] = amenity;
      }

      debugPrint("✅ AMENITIES: $amenitiesSelectedList");

      // ✅ Add selected images with proper mime types
      for (int i = 0; i < selectedImages.length; i++) {
        final imageFile = selectedImages[i];
        final fileName = imageFile.path.split('/').last;

        // Determine mime type based on file extension
        String contentType = 'image/jpeg';
        if (fileName.toLowerCase().endsWith('.png')) {
          contentType = 'image/png';
        } else if (fileName.toLowerCase().endsWith('.jpg') ||
            fileName.toLowerCase().endsWith('.jpeg')) {
          contentType = 'image/jpeg';
        }

        var multipartFile = await http.MultipartFile.fromPath(
          'images', // API expects 'images' field
          imageFile.path,
          filename: fileName,
          contentType: MediaType.parse(contentType),
        );

        request.files.add(multipartFile);
        debugPrint("📸 Added image $i: $fileName (Type: $contentType)");
      }

      debugPrint("📷 TOTAL IMAGES: ${selectedImages.length}");
      debugPrint("━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━");

      request.headers.addAll(headers);

      debugPrint("🚀 SENDING REQUEST...");
      debugPrint("  Files attached: ${request.files.length}");
      for (var file in request.files) {
        debugPrint("    - ${file.filename} (${file.contentType})");
      }

      // ✅ Send the request
      final response = await request.send();

      debugPrint("📥 RESPONSE RECEIVED:");
      debugPrint("  Status Code: ${response.statusCode}");
      debugPrint("  Reason: ${response.reasonPhrase}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        final respStr = await response.stream.bytesToString();
        debugPrint("✅ SUCCESS Response: $respStr");
        emit(
          SellPropertySaveSuccessState(
            sellPropertySaveResponseModel:
                sellPropertySaveResponseModelFromJson(respStr),
          ),
        );
      } else {
        final respStr = await response.stream.bytesToString();
        debugPrint("❌ ERROR Response Body: $respStr");

        // Parse error message from response if available
        String errorMessage = response.reasonPhrase ?? 'Unknown error';
        if (respStr.isNotEmpty) {
          try {
            // Try to extract error message from JSON response
            final errorData = respStr;
            if (errorData.contains('message')) {
              errorMessage = errorData;
            }
          } catch (e) {
            errorMessage = respStr.length > 100
                ? '${respStr.substring(0, 100)}...'
                : respStr;
          }
        }

        emit(SellErrorState(errorMsg: errorMessage));
      }
    } catch (e) {
      debugPrint("Exception: $e");
      emit(SellErrorState(errorMsg: e.toString()));
    }
  }
}
