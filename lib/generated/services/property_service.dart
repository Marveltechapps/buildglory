import '../core/api_client.dart';
import '../core/api_response.dart';
import '../models/property.dart';

/// Property service for managing properties
class PropertyService {
  final ApiClient _apiClient;

  PropertyService(this._apiClient);

  /// Get all properties with optional filters
  Future<ApiResponse<List<Property>>> getAllProperties({
    String? type,
    String? city,
  }) async {
    final queryParams = <String, String>{};
    if (type != null) queryParams['type'] = type;
    if (city != null) queryParams['city'] = city;

    return await _apiClient.get(
      '/properties',
      queryParameters: queryParams.isNotEmpty ? queryParams : null,
      fromJson: (json) {
        final list = json as List;
        return list.map((item) => Property.fromJson(item as Map<String, dynamic>)).toList();
      },
    );
  }

  /// Get property by ID
  Future<ApiResponse<Property>> getPropertyById(String id) async {
    return await _apiClient.get(
      '/properties/$id',
      fromJson: (json) => Property.fromJson(json as Map<String, dynamic>),
    );
  }

  /// Create new property
  Future<ApiResponse<Property>> createProperty(Property property) async {
    return await _apiClient.post(
      '/properties',
      body: property.toJson(),
      fromJson: (json) => Property.fromJson(json as Map<String, dynamic>),
    );
  }

  /// Update property
  Future<ApiResponse<Property>> updateProperty(String id, Property property) async {
    return await _apiClient.put(
      '/properties/$id',
      body: property.toJson(),
      fromJson: (json) => Property.fromJson(json as Map<String, dynamic>),
    );
  }

  /// Delete property
  Future<ApiResponse<Map<String, dynamic>>> deleteProperty(String id) async {
    return await _apiClient.delete(
      '/properties/$id',
      fromJson: (json) => json as Map<String, dynamic>,
    );
  }

  /// Get properties by type for homepage
  Future<ApiResponse<List<Property>>> getHomepageProperties({String? type}) async {
    final queryParams = type != null ? {'type': type} : null;
    return await _apiClient.get(
      '/homepage',
      queryParameters: queryParams,
      fromJson: (json) {
        final list = json as List;
        return list.map((item) => Property.fromJson(item as Map<String, dynamic>)).toList();
      },
    );
  }

  /// Search properties
  Future<ApiResponse<List<Property>>> searchProperties({
    String? type,
    String? city,
    String? locality,
    double? minPrice,
    double? maxPrice,
    int? bedrooms,
  }) async {
    final body = <String, dynamic>{};
    if (type != null) body['type'] = type;
    if (city != null) body['city'] = city;
    if (locality != null) body['locality'] = locality;
    if (minPrice != null) body['minPrice'] = minPrice;
    if (maxPrice != null) body['maxPrice'] = maxPrice;
    if (bedrooms != null) body['bedrooms'] = bedrooms;

    return await _apiClient.post(
      '/homepage/search',
      body: body,
      fromJson: (json) {
        final list = json as List;
        return list.map((item) => Property.fromJson(item as Map<String, dynamic>)).toList();
      },
    );
  }

  /// Explore and filter properties
  Future<ApiResponse<List<Property>>> exploreProperties({
    String? type,
    String? city,
  }) async {
    final queryParams = <String, String>{};
    if (type != null) queryParams['type'] = type;
    if (city != null) queryParams['city'] = city;

    return await _apiClient.get(
      '/explore',
      queryParameters: queryParams.isNotEmpty ? queryParams : null,
      fromJson: (json) {
        final list = json as List;
        return list.map((item) => Property.fromJson(item as Map<String, dynamic>)).toList();
      },
    );
  }
}

