import '../core/api_client.dart';
import '../core/api_response.dart';
import '../models/user.dart';

/// Profile management service
class ProfileService {
  final ApiClient _apiClient;

  ProfileService(this._apiClient);

  /// Get current user profile (requires authentication)
  Future<ApiResponse<User>> getProfile() async {
    return await _apiClient.get(
      '/profile',
      fromJson: (json) => User.fromJson(json as Map<String, dynamic>),
    );
  }

  /// Update user profile
  Future<ApiResponse<User>> updateProfile({
    String? name,
    String? email,
    String? profileImage,
  }) async {
    final body = <String, dynamic>{};
    if (name != null) body['name'] = name;
    if (email != null) body['email'] = email;
    if (profileImage != null) body['profileImage'] = profileImage;

    return await _apiClient.put(
      '/profile',
      body: body,
      fromJson: (json) => User.fromJson(json as Map<String, dynamic>),
    );
  }

  /// Delete user profile
  Future<ApiResponse<Map<String, dynamic>>> deleteProfile() async {
    return await _apiClient.delete(
      '/profile',
      fromJson: (json) => json as Map<String, dynamic>,
    );
  }
}

