import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_error.dart';
import 'api_response.dart';
import 'auth_manager.dart';

/// Base HTTP API Client with JWT authentication and error handling
class ApiClient {
  final String baseUrl;
  final AuthManager authManager;
  final http.Client _client;

  ApiClient({
    required this.baseUrl,
    required this.authManager,
    http.Client? client,
  }) : _client = client ?? http.Client();

  /// GET request
  Future<ApiResponse<T>> get<T>(
    String endpoint, {
    Map<String, String>? queryParameters,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      final uri = _buildUri(endpoint, queryParameters);
      final headers = await _getHeaders();

      final response = await _client.get(uri, headers: headers);
      return _handleResponse<T>(response, fromJson);
    } catch (e) {
      return ApiResponse.error(ApiError(
        message: 'Network error: $e',
        statusCode: 0,
      ));
    }
  }

  /// POST request
  Future<ApiResponse<T>> post<T>(
    String endpoint, {
    Map<String, dynamic>? body,
    Map<String, String>? queryParameters,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      final uri = _buildUri(endpoint, queryParameters);
      final headers = await _getHeaders();

      // Debug logging
      print('API POST Request: $uri');
      print('API POST Body: ${jsonEncode(body)}');

      final response = await _client.post(
        uri,
        headers: headers,
        body: body != null ? jsonEncode(body) : null,
      );
      return _handleResponse<T>(response, fromJson);
    } catch (e) {
      print('API POST Error: $e');
      return ApiResponse.error(ApiError(
        message: 'Network error: $e',
        statusCode: 0,
      ));
    }
  }

  /// PUT request
  Future<ApiResponse<T>> put<T>(
    String endpoint, {
    Map<String, dynamic>? body,
    Map<String, String>? queryParameters,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      final uri = _buildUri(endpoint, queryParameters);
      final headers = await _getHeaders();

      final response = await _client.put(
        uri,
        headers: headers,
        body: body != null ? jsonEncode(body) : null,
      );
      return _handleResponse<T>(response, fromJson);
    } catch (e) {
      return ApiResponse.error(ApiError(
        message: 'Network error: $e',
        statusCode: 0,
      ));
    }
  }

  /// DELETE request
  Future<ApiResponse<T>> delete<T>(
    String endpoint, {
    Map<String, String>? queryParameters,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      final uri = _buildUri(endpoint, queryParameters);
      final headers = await _getHeaders();

      final response = await _client.delete(uri, headers: headers);
      return _handleResponse<T>(response, fromJson);
    } catch (e) {
      return ApiResponse.error(ApiError(
        message: 'Network error: $e',
        statusCode: 0,
      ));
    }
  }

  /// Multipart POST request for file uploads
  Future<ApiResponse<T>> postMultipart<T>(
    String endpoint, {
    required Map<String, String> fields,
    required List<http.MultipartFile> files,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      final uri = _buildUri(endpoint, null);
      final request = http.MultipartRequest('POST', uri);

      // Add headers
      final headers = await _getHeaders(includeContentType: false);
      request.headers.addAll(headers);

      // Add fields
      request.fields.addAll(fields);

      // Add files
      request.files.addAll(files);

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      return _handleResponse<T>(response, fromJson);
    } catch (e) {
      return ApiResponse.error(ApiError(
        message: 'Network error: $e',
        statusCode: 0,
      ));
    }
  }

  /// Build URI with base URL and query parameters
  Uri _buildUri(String endpoint, Map<String, String>? queryParameters) {
    final path = endpoint.startsWith('/') ? endpoint : '/$endpoint';
    final fullPath = baseUrl.endsWith('/') 
        ? '$baseUrl${path.substring(1)}' 
        : '$baseUrl$path';

    return Uri.parse(fullPath).replace(queryParameters: queryParameters);
  }

  /// Get headers with JWT authentication
  Future<Map<String, String>> _getHeaders({bool includeContentType = true}) async {
    final headers = <String, String>{};
    
    if (includeContentType) {
      headers['Content-Type'] = 'application/json';
    }
    headers['Accept'] = 'application/json';

    // Add JWT token if available
    final token = await authManager.getToken();
    if (token != null && token.isNotEmpty) {
      headers['Authorization'] = 'Bearer $token';
    }

    return headers;
  }

  /// Handle HTTP response and parse JSON
  ApiResponse<T> _handleResponse<T>(
    http.Response response,
    T Function(dynamic)? fromJson,
  ) {
    final statusCode = response.statusCode;

    try {
      // Debug logging
      print('API Response Status: $statusCode');
      print('API Response Body: ${response.body}');

      // Parse response body
      final dynamic jsonData = response.body.isNotEmpty
          ? jsonDecode(response.body)
          : null;

      // Success responses (2xx)
      if (statusCode >= 200 && statusCode < 300) {
        if (fromJson != null && jsonData != null) {
          final data = fromJson(jsonData);
          return ApiResponse.success(data);
        }
        return ApiResponse.success(jsonData as T?);
      }

      // Error responses (4xx, 5xx)
      final errorMessage = _extractErrorMessage(jsonData);
      return ApiResponse.error(ApiError(
        message: errorMessage,
        statusCode: statusCode,
        error: jsonData,
      ));
    } catch (e) {
      print('API Response Parse Error: $e');
      return ApiResponse.error(ApiError(
        message: 'Failed to parse response: $e',
        statusCode: statusCode,
      ));
    }
  }

  /// Extract error message from response
  String _extractErrorMessage(dynamic jsonData) {
    if (jsonData is Map<String, dynamic>) {
      if (jsonData.containsKey('message')) {
        return jsonData['message'] as String;
      }
      if (jsonData.containsKey('error')) {
        final error = jsonData['error'];
        if (error is String) return error;
        if (error is Map) return error.toString();
      }
    }
    return 'An error occurred';
  }

  /// Dispose the client
  void dispose() {
    _client.close();
  }
}

