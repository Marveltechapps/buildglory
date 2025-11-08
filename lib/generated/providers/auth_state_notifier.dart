import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../api_exports.dart';
import 'api_providers.dart';

/// =============================================================================
/// AUTH STATE
/// =============================================================================

class AuthState {
  final bool isAuthenticated;
  final User? user;
  final bool isLoading;
  final String? error;

  const AuthState({
    this.isAuthenticated = false,
    this.user,
    this.isLoading = false,
    this.error,
  });

  AuthState copyWith({
    bool? isAuthenticated,
    User? user,
    bool? isLoading,
    String? error,
  }) {
    return AuthState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}

/// =============================================================================
/// AUTH STATE NOTIFIER
/// =============================================================================

class AuthStateNotifier extends StateNotifier<AuthState> {
  final AuthService _authService;
  final ProfileService _profileService;

  AuthStateNotifier(this._authService, this._profileService)
      : super(const AuthState()) {
    _checkAuthStatus();
  }

  /// Check initial authentication status
  Future<void> _checkAuthStatus() async {
    state = state.copyWith(isLoading: true);

    final isAuth = await _authService.isAuthenticated();
    if (isAuth) {
      await _loadUserProfile();
    } else {
      state = state.copyWith(isLoading: false);
    }
  }

  /// Load user profile
  Future<void> _loadUserProfile() async {
    final response = await _profileService.getProfile();
    response.when(
      success: (user) {
        state = state.copyWith(
          isAuthenticated: true,
          user: user,
          isLoading: false,
          error: null,
        );
      },
      failure: (error) {
        state = state.copyWith(
          isAuthenticated: true,
          isLoading: false,
          error: error.message,
        );
      },
    );
  }

  /// Send OTP
  Future<bool> sendOTP(String mobileNumber) async {
    state = state.copyWith(isLoading: true, error: null);

    final response = await _authService.sendOTP(mobileNumber);
    final success = response.when(
      success: (_) => true,
      failure: (error) {
        state = state.copyWith(error: error.message);
        return false;
      },
    );

    state = state.copyWith(isLoading: false);
    return success;
  }

  /// Verify OTP and login
  Future<bool> verifyOTP({
    required String mobileNumber,
    required String otp,
  }) async {
    state = state.copyWith(isLoading: true, error: null);

    final response = await _authService.verifyOTP(
      mobileNumber: mobileNumber,
      otp: otp,
    );

    final success = await response.when(
      success: (authData) async {
        state = state.copyWith(
          isAuthenticated: true,
          user: authData.user,
          isLoading: false,
          error: null,
        );
        return true;
      },
      failure: (error) {
        state = state.copyWith(
          isLoading: false,
          error: error.message,
        );
        return false;
      },
    );

    return success;
  }

  /// Resend OTP
  Future<bool> resendOTP(String mobileNumber) async {
    state = state.copyWith(isLoading: true, error: null);

    final response = await _authService.resendOTP(mobileNumber);
    final success = response.when(
      success: (_) => true,
      failure: (error) {
        state = state.copyWith(error: error.message);
        return false;
      },
    );

    state = state.copyWith(isLoading: false);
    return success;
  }

  /// Update profile
  Future<bool> updateProfile({
    String? name,
    String? email,
    String? profileImage,
  }) async {
    state = state.copyWith(isLoading: true, error: null);

    final response = await _profileService.updateProfile(
      name: name,
      email: email,
      profileImage: profileImage,
    );

    final success = response.when(
      success: (user) {
        state = state.copyWith(
          user: user,
          isLoading: false,
          error: null,
        );
        return true;
      },
      failure: (error) {
        state = state.copyWith(
          isLoading: false,
          error: error.message,
        );
        return false;
      },
    );

    return success;
  }

  /// Logout
  Future<void> logout() async {
    await _authService.logout();
    state = const AuthState();
  }

  /// Clear error
  void clearError() {
    state = state.copyWith(error: null);
  }
}

/// =============================================================================
/// AUTH STATE PROVIDER
/// =============================================================================

final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>((ref) {
  final authService = ref.watch(authServiceProvider);
  final profileService = ref.watch(profileServiceProvider);
  return AuthStateNotifier(authService, profileService);
});

