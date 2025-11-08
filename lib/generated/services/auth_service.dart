import '../core/api_client.dart';
import '../core/api_response.dart';
import '../models/user.dart';

class AuthResponse {
  final String token;
  final User user;

  AuthResponse({
    required this.token,
    required this.user,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      token: json['token'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );
  }
}

/// Authentication service for OTP-based login
class AuthService {
  final ApiClient _apiClient;

  AuthService(this._apiClient);

  /// Send OTP to mobile number
  Future<ApiResponse<Map<String, dynamic>>> sendOTP(String mobileNumber) async {
    return await _apiClient.post(
      '/signin/send-otp',
      body: {'mobileNumber': mobileNumber},
      fromJson: (json) => json as Map<String, dynamic>,
    );
  }

  /// Verify OTP and get JWT token
  Future<ApiResponse<AuthResponse>> verifyOTP({
    required String mobileNumber,
    required String otp,
  }) async {
    final response = await _apiClient.post<Map<String, dynamic>>(
      '/signin/verify-otp',
      body: {
        'mobileNumber': mobileNumber,
        'otp': otp,
      },
      fromJson: (json) => json as Map<String, dynamic>,
    );

    if (response.isSuccess && response.data != null) {
      // Save token to auth manager
      final authResponse = AuthResponse.fromJson(response.data!);
      await _apiClient.authManager.saveToken(authResponse.token);
      return ApiResponse.success(authResponse);
    }

    return ApiResponse.error(response.error!);
  }

  /// Resend OTP
  Future<ApiResponse<Map<String, dynamic>>> resendOTP(String mobileNumber) async {
    return await _apiClient.post(
      '/signin/resend-otp',
      body: {'mobileNumber': mobileNumber},
      fromJson: (json) => json as Map<String, dynamic>,
    );
  }

  /// Get user by mobile number
  Future<ApiResponse<User>> getUserByPhone(String mobileNumber) async {
    return await _apiClient.get(
      '/signin/$mobileNumber',
      fromJson: (json) => User.fromJson(json as Map<String, dynamic>),
    );
  }

  /// Delete user by mobile number
  Future<ApiResponse<Map<String, dynamic>>> deleteUserByPhone(String mobileNumber) async {
    return await _apiClient.delete(
      '/signin/$mobileNumber',
      fromJson: (json) => json as Map<String, dynamic>,
    );
  }

  /// Logout user
  Future<void> logout() async {
    await _apiClient.authManager.clearToken();
  }

  /// Check if user is authenticated
  Future<bool> isAuthenticated() async {
    return await _apiClient.authManager.isAuthenticated();
  }
}

