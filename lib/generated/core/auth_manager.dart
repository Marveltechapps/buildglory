import 'dart:async';

/// Interface for managing JWT authentication tokens
abstract class AuthManager {
  /// Get the current JWT token
  Future<String?> getToken();

  /// Save JWT token
  Future<void> saveToken(String token, {String? refreshToken, DateTime? expiresAt});

  /// Clear JWT token (logout)
  Future<void> clearToken();

  /// Check if user is authenticated
  Future<bool> isAuthenticated();
}

/// Default implementation using in-memory storage
/// For production, use SharedPreferences or secure storage
class InMemoryAuthManager implements AuthManager {
  String? _token;
  final StreamController<String?> _tokenController = StreamController<String?>.broadcast();

  /// Stream of token changes
  Stream<String?> get tokenStream => _tokenController.stream;

  @override
  Future<String?> getToken() async {
    return _token;
  }

  @override
  Future<void> saveToken(String token, {String? refreshToken, DateTime? expiresAt}) async {
    _token = token;
    _tokenController.add(token);
  }

  @override
  Future<void> clearToken() async {
    _token = null;
    _tokenController.add(null);
  }

  @override
  Future<bool> isAuthenticated() async {
    return _token != null && _token!.isNotEmpty;
  }

  void dispose() {
    _tokenController.close();
  }
}

