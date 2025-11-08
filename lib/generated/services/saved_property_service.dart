import '../core/api_client.dart';
import '../core/api_response.dart';
import '../models/saved_property.dart';

/// Saved properties service
class SavedPropertyService {
  final ApiClient _apiClient;

  SavedPropertyService(this._apiClient);

  /// Get saved properties (requires authentication)
  Future<ApiResponse<SavedProperty>> getSavedProperties() async {
    return await _apiClient.get(
      '/saved',
      fromJson: (json) => SavedProperty.fromJson(json as Map<String, dynamic>),
    );
  }

  /// Save a property
  Future<ApiResponse<Map<String, dynamic>>> saveProperty(String propertyId) async {
    return await _apiClient.post(
      '/saved/add',
      body: {'propertyId': propertyId},
      fromJson: (json) => json as Map<String, dynamic>,
    );
  }

  /// Remove saved property
  Future<ApiResponse<Map<String, dynamic>>> removeSavedProperty(String propertyId) async {
    return await _apiClient.post(
      '/saved/remove',
      body: {'propertyId': propertyId},
      fromJson: (json) => json as Map<String, dynamic>,
    );
  }
}

