import 'package:buildglory/api/apiservice.dart';
import 'package:buildglory/final/propertylist/model/property_list_response_mode.dart';

class PropertyRepository {
  PropertyRepository({ApiService? apiService})
      : _apiService = apiService ?? ApiService();

  final ApiService _apiService;

  Future<List<PropertyListResponseModel>> fetchHomepageProperties({
    required String type,
  }) async {
    final response = await _apiService.get(
      'api/homepage',
      queryParameters: {'type': type},
      authenticated: true,
    );

    if (!response.isSuccess) {
      throw Exception(_extractMessage(response));
    }

    if (response.data is List) {
      return (response.data as List)
          .map((item) => PropertyListResponseModel.fromJson(
                Map<String, dynamic>.from(item as Map),
              ))
          .toList();
    }

    throw Exception('Unexpected homepage response format.');
  }

  Future<List<PropertyListResponseModel>> searchHomepageProperties({
    required String query,
  }) async {
    final response = await _apiService.post(
      'api/homepage/search',
      body: {'query': query},
      authenticated: true,
    );

    if (!response.isSuccess) {
      throw Exception(_extractMessage(response));
    }

    if (response.data is List) {
      return (response.data as List)
          .map((item) => PropertyListResponseModel.fromJson(
                Map<String, dynamic>.from(item as Map),
              ))
          .toList();
    }

    throw Exception('Unexpected search response format.');
  }

  Future<List<PropertyListResponseModel>> exploreProperties({
    String? location,
    String? type,
    int? minPrice,
    int? maxPrice,
  }) async {
    final response = await _apiService.get(
      'api/explore',
      queryParameters: {
        if (location != null && location.isNotEmpty) 'location': location,
        if (type != null && type.isNotEmpty) 'type': type,
        if (minPrice != null) 'minPrice': minPrice,
        if (maxPrice != null) 'maxPrice': maxPrice,
      },
      authenticated: true,
    );

    if (!response.isSuccess) {
      throw Exception(_extractMessage(response));
    }

    if (response.data is List) {
      return (response.data as List)
          .map((item) => PropertyListResponseModel.fromJson(
                Map<String, dynamic>.from(item as Map),
              ))
          .toList();
    }

    throw Exception('Unexpected explore response format.');
  }

  Future<ApiResponse> createProperty(Map<String, dynamic> propertyData) =>
      _apiService.post(
        'api/properties',
        body: propertyData,
        authenticated: true,
      );

  Future<ApiResponse> updateProperty(
    String id,
    Map<String, dynamic> propertyData,
  ) =>
      _apiService.put(
        'api/properties/$id',
        body: propertyData,
        authenticated: true,
      );

  Future<ApiResponse> deleteProperty(String id) => _apiService.delete(
        'api/properties/$id',
        authenticated: true,
      );

  Future<ApiResponse> fetchPropertyById(String id) => _apiService.get(
        'api/properties/$id',
        authenticated: true,
      );

  Future<ApiResponse> listAllProperties() => _apiService.get(
        'api/properties',
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
        'Unable to process property request.';
  }
}
