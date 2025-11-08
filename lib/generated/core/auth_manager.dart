import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

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

/// SharedPreferences implementation for persistent token storage
class SharedPreferencesAuthManager implements AuthManager {
  static const String _tokenKey = 'auth_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _expiresAtKey = 'expires_at';

  final StreamController<String?> _tokenController = StreamController<String?>.broadcast();

  /// Stream of token changes
  Stream<String?> get tokenStream => _tokenController.stream;

  @override
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  @override
  Future<void> saveToken(String token, {String? refreshToken, DateTime? expiresAt}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
    
    if (refreshToken != null) {
      await prefs.setString(_refreshTokenKey, refreshToken);
    }
    
    if (expiresAt != null) {
      await prefs.setString(_expiresAtKey, expiresAt.toIso8601String());
    }
    
    _tokenController.add(token);
  }

  @override
  Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
    await prefs.remove(_refreshTokenKey);
    await prefs.remove(_expiresAtKey);
    _tokenController.add(null);
  }

  @override
  Future<bool> isAuthenticated() async {
    final token = await getToken();
    if (token == null || token.isEmpty) {
      return false;
    }

    // Check if token is expired
    final prefs = await SharedPreferences.getInstance();
    final expiresAtStr = prefs.getString(_expiresAtKey);
    
    if (expiresAtStr != null) {
      final expiresAt = DateTime.parse(expiresAtStr);
      if (DateTime.now().isAfter(expiresAt)) {
        await clearToken();
        return false;
      }
    }

    return true;
  }

  void dispose() {
    _tokenController.close();
  }
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

