import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../core/api_client.dart';
import '../core/api_error.dart';
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

  /// Upload profile image file using multipart/form-data
  Future<ApiResponse<String>> uploadProfileImage(String filePath) async {
    try {
      final uri = _buildUri('/user/upload-profile-image');
      final request = http.MultipartRequest('POST', uri);
      debugPrint(uri.toString());
      final token = await _apiClient.authManager.getToken();
      if (token != null && token.isNotEmpty) {
        request.headers['Accept'] = 'application/json';
        request.headers['Authorization'] = 'Bearer $token';
      }

      debugPrint(request.headers.toString());
      request.files.add(
        await http.MultipartFile.fromPath('profileImage', filePath),
      );

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final body = response.body.isNotEmpty
            ? jsonDecode(response.body) as Map<String, dynamic>
            : <String, dynamic>{};
        return ApiResponse.success(body['profileImage'] as String? ?? '');
      }

      final errorMessage = _extractErrorMessage(response);
      return ApiResponse.error(
        ApiError(
          message: errorMessage,
          statusCode: response.statusCode,
        ),
      );
    } catch (e) {
      return ApiResponse.error(
        ApiError(
          message: 'Failed to upload profile image: $e',
          statusCode: 0,
        ),
      );
    }
  }

  Uri _buildUri(String endpoint) {
    final base = _apiClient.baseUrl;
    if (endpoint.startsWith('http')) {
      return Uri.parse(endpoint);
    }
    if (base.endsWith('/') && endpoint.startsWith('/')) {
      return Uri.parse('${base.substring(0, base.length - 1)}$endpoint');
    } else if (!base.endsWith('/') && !endpoint.startsWith('/')) {
      return Uri.parse('$base/$endpoint');
    }
    return Uri.parse('$base$endpoint');
  }

  String _extractErrorMessage(http.Response response) {
    try {
      if (response.body.isEmpty) return 'Failed to upload profile image';
      final jsonData = jsonDecode(response.body);
      if (jsonData is Map<String, dynamic>) {
        if (jsonData['message'] is String) return jsonData['message'];
        if (jsonData['error'] is String) return jsonData['error'];
      }
      return 'Failed to upload profile image';
    } catch (_) {
      return 'Failed to upload profile image';
    }
  }
}
