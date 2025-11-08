import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth_manager.dart';

/// Production-ready auth manager using SharedPreferences for persistent storage
class SecureAuthManager implements AuthManager {
  static const String _tokenKey = 'jwt_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _tokenExpiryKey = 'token_expiry';
  
  final StreamController<String?> _tokenController = StreamController<String?>.broadcast();
  
  /// Stream of token changes
  Stream<String?> get tokenStream => _tokenController.stream;

  @override
  Future<String?> getToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString(_tokenKey);
      
      // Check if token is expired
      if (token != null) {
        final expiry = prefs.getInt(_tokenExpiryKey);
        if (expiry != null) {
          final expiryDate = DateTime.fromMillisecondsSinceEpoch(expiry);
          if (DateTime.now().isAfter(expiryDate)) {
            // Token expired, clear it
            await clearToken();
            return null;
          }
        }
      }
      
      return token;
    } catch (e) {
      // If there's an error reading from storage, return null
      return null;
    }
  }

  @override
  Future<void> saveToken(String token, {String? refreshToken, DateTime? expiresAt}) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_tokenKey, token);
      
      if (refreshToken != null) {
        await prefs.setString(_refreshTokenKey, refreshToken);
      }
      
      if (expiresAt != null) {
        await prefs.setInt(_tokenExpiryKey, expiresAt.millisecondsSinceEpoch);
      } else {
        // Default expiry: 7 days from now
        final defaultExpiry = DateTime.now().add(const Duration(days: 7));
        await prefs.setInt(_tokenExpiryKey, defaultExpiry.millisecondsSinceEpoch);
      }
      
      _tokenController.add(token);
    } catch (e) {
      // Handle storage errors
      throw Exception('Failed to save token: $e');
    }
  }

  @override
  Future<void> clearToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_tokenKey);
      await prefs.remove(_refreshTokenKey);
      await prefs.remove(_tokenExpiryKey);
      _tokenController.add(null);
    } catch (e) {
      // Handle storage errors
      throw Exception('Failed to clear token: $e');
    }
  }

  @override
  Future<bool> isAuthenticated() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }

  /// Get refresh token
  Future<String?> getRefreshToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_refreshTokenKey);
    } catch (e) {
      return null;
    }
  }

  /// Get token expiry date
  Future<DateTime?> getTokenExpiry() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final expiry = prefs.getInt(_tokenExpiryKey);
      if (expiry != null) {
        return DateTime.fromMillisecondsSinceEpoch(expiry);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  /// Check if token is expired
  Future<bool> isTokenExpired() async {
    final expiry = await getTokenExpiry();
    if (expiry == null) return false;
    return DateTime.now().isAfter(expiry);
  }

  /// Dispose resources
  void dispose() {
    _tokenController.close();
  }
}

