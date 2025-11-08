import 'dart:convert';

import 'package:buildglory/api/apiservice.dart';
import 'package:buildglory/final/login/model/sendotp_response_model.dart';
import 'package:buildglory/final/login/model/user_lookup_response_model.dart';
import 'package:buildglory/final/login/model/verifyotp_response_model.dart';

class AuthRepository {
  AuthRepository({ApiService? apiService}) : _apiService = apiService ?? ApiService();

  final ApiService _apiService;

  Future<SendOtpResponseModel> sendOtp(String mobileNumber) async {
    final response = await _apiService.post(
      'api/signin/send-otp',
      body: {'mobileNumber': mobileNumber},
      authenticated: false,
    );
    _throwIfNotSuccessful(response);

    return SendOtpResponseModel.fromJson(_ensureMap(response));
  }

  Future<SendOtpResponseModel> resendOtp(String mobileNumber) async {
    final response = await _apiService.post(
      'api/signin/resend-otp',
      body: {'mobileNumber': mobileNumber},
      authenticated: false,
    );
    _throwIfNotSuccessful(response);

    return SendOtpResponseModel.fromJson(_ensureMap(response));
  }

  Future<VerifyOtpResponseModel> verifyOtp({
    required String mobileNumber,
    required String otp,
  }) async {
    final response = await _apiService.post(
      'api/signin/verify-otp',
      body: {
        'mobileNumber': mobileNumber,
        'enteredOTP': otp,
      },
      authenticated: false,
    );
    _throwIfNotSuccessful(response);

    return VerifyOtpResponseModel.fromJson(_ensureMap(response));
  }

  Future<UserLookupResponseModel> getUserByMobile(String mobileNumber) async {
    final response = await _apiService.get(
      'api/signin/$mobileNumber',
      authenticated: true,
    );
    _throwIfNotSuccessful(response);

    return UserLookupResponseModel.fromJson(_ensureMap(response));
  }

  Future<UserLookupResponseModel> deleteUserByMobile(String mobileNumber) async {
    final response = await _apiService.delete(
      'api/signin/$mobileNumber',
      authenticated: true,
    );
    _throwIfNotSuccessful(response);

    return UserLookupResponseModel.fromJson(_ensureMap(response));
  }

  void _throwIfNotSuccessful(ApiResponse response) {
    if (!response.isSuccess) {
      final message = _extractErrorMessage(response);
      throw ApiException(message, statusCode: response.statusCode);
    }
  }

  String _extractErrorMessage(ApiResponse response) {
    if (response.data is Map && (response.data as Map)['message'] != null) {
      return (response.data as Map)['message'].toString();
    }
    if (response.data is Map && (response.data as Map)['error'] != null) {
      return (response.data as Map)['error'].toString();
    }
    return response.error ??
        response.rawBody ??
        'Something went wrong. Please try again later.';
  }

  Map<String, dynamic> _ensureMap(ApiResponse response) {
    if (response.data is Map<String, dynamic>) {
      return Map<String, dynamic>.from(response.data as Map<String, dynamic>);
    }

    if (response.data is Map) {
      return Map<String, dynamic>.from(response.data as Map);
    }

    if (response.rawBody != null && response.rawBody!.isNotEmpty) {
      try {
        final decoded = jsonDecode(response.rawBody!);
        if (decoded is Map) {
          return Map<String, dynamic>.from(decoded as Map);
        }
      } catch (_) {
        // Ignore - handled below.
      }
    }

    throw ApiException(
      'Unexpected response format from server.',
      statusCode: response.statusCode,
    );
  }
}

class ApiException implements Exception {
  ApiException(this.message, {this.statusCode});

  final String message;
  final int? statusCode;

  @override
  String toString() => 'ApiException($statusCode): $message';
}
