import 'dart:convert';

import 'package:buildglory/api/apiservice.dart';
import 'package:buildglory/final/sell/model/sell_property_save_response_mode.dart';
import 'package:http/http.dart' as http;

class SellRepository {
  SellRepository({ApiService? apiService})
      : _apiService = apiService ?? ApiService();

  final ApiService _apiService;

  Future<SellPropertySaveResponseModel> createSellListing({
    required Map<String, String> fields,
    List<String>? amenities,
    List<http.MultipartFile>? images,
  }) async {
    final payload = Map<String, String>.from(fields);
    if (amenities != null && amenities.isNotEmpty) {
      for (var i = 0; i < amenities.length; i++) {
        payload['amenities[$i]'] = amenities[i];
      }
    }

    final response = await _apiService.multipart(
      'api/sells',
      fields: payload,
      files: images,
      authenticated: true,
    );

    if (!response.isSuccess) {
      throw Exception(_extractMessage(response));
    }

    return SellPropertySaveResponseModel.fromJson(_ensureMap(response));
  }

  Future<ApiResponse> fetchSellListings() => _apiService.get(
        'api/sells',
        authenticated: true,
      );

  Future<ApiResponse> fetchSellListingById(String id) => _apiService.get(
        'api/sells/$id',
        authenticated: true,
      );

  Future<ApiResponse> updateSellListing(
    String id,
    Map<String, dynamic> payload,
  ) =>
      _apiService.put(
        'api/sells/$id',
        body: payload,
        authenticated: true,
      );

  Future<ApiResponse> deleteSellListing(String id) => _apiService.delete(
        'api/sells/$id',
        authenticated: true,
      );

  String _extractMessage(ApiResponse response) {
    if (response.data is Map && (response.data as Map)['message'] != null) {
      return (response.data as Map)['message'].toString();
    }
    if (response.data is Map && (response.data as Map)['error'] != null) {
      return (response.data as Map)['error'].toString();
    }
    return response.error ??
        response.rawBody ??
        'Unable to process sell listing.';
  }

  Map<String, dynamic> _ensureMap(ApiResponse response) {
    if (response.data is Map<String, dynamic>) {
      return Map<String, dynamic>.from(response.data as Map<String, dynamic>);
    }
    if (response.data is Map) {
      return Map<String, dynamic>.from(response.data as Map);
    }
    if (response.rawBody != null && response.rawBody!.isNotEmpty) {
      final decoded = jsonDecode(response.rawBody!);
      if (decoded is Map) {
        return Map<String, dynamic>.from(decoded as Map);
      }
    }
    throw Exception('Unexpected sell response format.');
  }
}
