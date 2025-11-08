import 'dart:convert';
import 'dart:io';

import 'package:buildglory/constant/constant.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

/// Centralised HTTP client used across the app.
///
/// Provides convenience helpers for GET/POST/PUT/PATCH/DELETE along with
/// consistent header construction, JSON encoding/decoding and basic
/// error-handling. Existing code that relies on [postRequest] will continue
/// to work for backwards compatibility.
class ApiService {
  ApiService._internal({http.Client? client}) : _client = client ?? http.Client();

  static final ApiService _instance = ApiService._internal();

  factory ApiService() => _instance;

  final http.Client _client;

  /// Performs a GET request.
  Future<ApiResponse> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    bool authenticated = true,
  }) async {
    final uri = _buildUri(path, queryParameters);
    final requestHeaders = _buildHeaders(
      headers,
      authenticated: authenticated,
      includesJsonContentType: false,
    );

    return _send(() => _client.get(uri, headers: requestHeaders));
  }

  /// Performs a POST request with an optional JSON body.
  Future<ApiResponse> post(
    String path, {
    dynamic body,
    Map<String, String>? headers,
    bool authenticated = true,
  }) async {
    final uri = _buildUri(path);
    final requestHeaders = _buildHeaders(headers, authenticated: authenticated);
    final encodedBody = _encodeBody(body);

    return _send(() => _client.post(uri, headers: requestHeaders, body: encodedBody));
  }

  /// Performs a PUT request with an optional JSON body.
  Future<ApiResponse> put(
    String path, {
    dynamic body,
    Map<String, String>? headers,
    bool authenticated = true,
  }) async {
    final uri = _buildUri(path);
    final requestHeaders = _buildHeaders(headers, authenticated: authenticated);
    final encodedBody = _encodeBody(body);

    return _send(() => _client.put(uri, headers: requestHeaders, body: encodedBody));
  }

  /// Performs a PATCH request with an optional JSON body.
  Future<ApiResponse> patch(
    String path, {
    dynamic body,
    Map<String, String>? headers,
    bool authenticated = true,
  }) async {
    final uri = _buildUri(path);
    final requestHeaders = _buildHeaders(headers, authenticated: authenticated);
    final encodedBody = _encodeBody(body);

    return _send(() => _client.patch(uri, headers: requestHeaders, body: encodedBody));
  }

  /// Performs a DELETE request.
  Future<ApiResponse> delete(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    dynamic body,
    bool authenticated = true,
  }) async {
    final uri = _buildUri(path, queryParameters);
    final requestHeaders = _buildHeaders(
      headers,
      authenticated: authenticated,
      includesJsonContentType: body != null,
    );
    final encodedBody = _encodeBody(body);

    return _send(() => _client.delete(uri, headers: requestHeaders, body: encodedBody));
  }

  /// Performs a multipart/form-data POST request.
  Future<ApiResponse> multipart(
    String path, {
    Map<String, String>? fields,
    List<http.MultipartFile>? files,
    Map<String, String>? headers,
    bool authenticated = true,
  }) async {
    final uri = _buildUri(path);
    final requestHeaders = _buildHeaders(
      headers,
      authenticated: authenticated,
      includesJsonContentType: false,
    );

    final request = http.MultipartRequest('POST', uri)..headers.addAll(requestHeaders);

    if (fields != null && fields.isNotEmpty) {
      request.fields.addAll(fields);
    }

    if (files != null) {
      request.files.addAll(files);
    }

    return _sendMultipart(request);
  }

  /// Legacy helper retained for backwards compatibility.
  ///
  /// Prefer using [post] with JSON maps instead.
  Future<Response> postRequest(String api, dynamic object) async {
    final apiResponse = await post(api, body: object);
    return Response(
      apiResponse.statusCode,
      apiResponse.data ?? apiResponse.rawBody,
    );
  }

  /// Builds a full [Uri] from either an absolute URL or a relative path.
  Uri _buildUri(String path, [Map<String, dynamic>? queryParameters]) {
    if (path.startsWith('http://') || path.startsWith('https://')) {
      final uri = Uri.parse(path);
      if (queryParameters == null || queryParameters.isEmpty) {
        return uri;
      }
      final mergedQuery = Map<String, dynamic>.from(uri.queryParameters);
      mergedQuery.addAll(queryParameters);
      return uri.replace(queryParameters: _encodeQueryParameters(mergedQuery));
    }

    final base = baseUrl.endsWith('/') ? baseUrl : '$baseUrl/';
    return Uri.parse('$base$path').replace(
      queryParameters: _encodeQueryParameters(queryParameters),
    );
  }

  Map<String, String>? _encodeQueryParameters(Map<String, dynamic>? params) {
    if (params == null || params.isEmpty) return null;
    return params.map(
      (key, value) => MapEntry(key, value?.toString() ?? ''),
    );
  }

  Map<String, String> _buildHeaders(
    Map<String, String>? customHeaders, {
    bool authenticated = true,
    bool includesJsonContentType = true,
  }) {
    final headers = <String, String>{'Accept': 'application/json'};

    if (includesJsonContentType) {
      headers['Content-Type'] = 'application/json';
    }

    if (authenticated && token.isNotEmpty) {
      headers['Authorization'] = 'Bearer $token';
    }

    if (customHeaders != null) {
      headers.addAll(customHeaders);
    }

    return headers;
  }

  String? _encodeBody(dynamic body) {
    if (body == null) return null;
    if (body is String) return body;
    if (body is List<int>) return utf8.decode(body);

    try {
      return jsonEncode(body);
    } catch (error, stackTrace) {
      debugPrint('Failed to encode body: $error');
      debugPrintStack(stackTrace: stackTrace);
      return null;
    }
  }

  Future<ApiResponse> _send(Future<http.Response> Function() request) async {
    try {
      final response = await request();
      return _mapResponse(response);
    } on SocketException catch (error) {
      return ApiResponse.networkError(error);
    } catch (error, stackTrace) {
      debugPrint('HTTP request failed: $error');
      debugPrintStack(stackTrace: stackTrace);
      return ApiResponse.unexpectedError(error);
    }
  }

  Future<ApiResponse> _sendMultipart(http.MultipartRequest request) async {
    try {
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      return _mapResponse(response);
    } on SocketException catch (error) {
      return ApiResponse.networkError(error);
    } catch (error, stackTrace) {
      debugPrint('Multipart request failed: $error');
      debugPrintStack(stackTrace: stackTrace);
      return ApiResponse.unexpectedError(error);
    }
  }

  ApiResponse _mapResponse(http.Response response) {
    dynamic data;
    if (response.body.isNotEmpty) {
      try {
        data = jsonDecode(response.body);
      } catch (_) {
        data = response.body;
      }
    }

    return ApiResponse(
      statusCode: response.statusCode,
      data: data,
      rawBody: response.body,
      headers: response.headers,
    );
  }
}

/// Standardised response returned by [ApiService].
class ApiResponse {
  ApiResponse({
    required this.statusCode,
    this.data,
    this.rawBody,
    this.headers,
    this.error,
  });

  factory ApiResponse.networkError(SocketException exception) => ApiResponse(
        statusCode: 0,
        error: 'No Internet Connection. Please check your network status.',
        rawBody: exception.message,
      );

  factory ApiResponse.unexpectedError(Object error) => ApiResponse(
        statusCode: -1,
        error: error.toString(),
      );

  final int statusCode;
  final dynamic data;
  final String? rawBody;
  final Map<String, String>? headers;
  final String? error;

  bool get isSuccess => statusCode >= 200 && statusCode < 300;
}

/// Legacy response wrapper used in older parts of the codebase.
class Response {
  Response(this.statusCode, this.resBody);

  final int? statusCode;
  final dynamic resBody;
}
