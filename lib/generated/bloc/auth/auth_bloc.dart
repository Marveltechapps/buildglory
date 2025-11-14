import 'package:buildglory/constant/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../services/auth_service.dart';
import '../../services/profile_service.dart';
import 'auth_event.dart';
import 'auth_state.dart';

/// Authentication BLoC
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService;
  final ProfileService _profileService;

  AuthBloc({
    required AuthService authService,
    required ProfileService profileService,
  })  : _authService = authService,
        _profileService = profileService,
        super(const AuthInitial()) {
    on<CheckAuthStatusEvent>(_onCheckAuthStatus);
    on<SendOTPEvent>(_onSendOTP);
    on<VerifyOTPEvent>(_onVerifyOTP);
    on<ResendOTPEvent>(_onResendOTP);
    on<LoadUserProfileEvent>(_onLoadUserProfile);
    on<UpdateProfileEvent>(_onUpdateProfile);
    on<LogoutEvent>(_onLogout);
    on<SPEvent>(saveinsharedpreference);
    on<ClearAuthErrorEvent>(_onClearError);
    on<UploadProfileImageEvent>(_onUploadProfileImage);
    // Check auth status on initialization
    add(const CheckAuthStatusEvent());
    on<DummyEvent>(dummy);
  }

  dummy(DummyEvent event, Emitter<AuthState> emit) async {
    emit(const AuthInitial());
    emit(const DummyState());
  }

  saveinsharedpreference(
    SPEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    await prefs.setString('token', event.token);
    emit(SPSavedState(token: event.token));
  }

  Future<void> _onCheckAuthStatus(
    CheckAuthStatusEvent event,
    Emitter<AuthState> emit,
  ) async {
    print('🔍 AuthBloc: Checking authentication status...');
    emit(const AuthLoading());

    final isAuth = await _authService.isAuthenticated();
    print('🔍 AuthBloc: isAuthenticated = $isAuth');

    if (isAuth) {
      print('✅ AuthBloc: User is authenticated, loading profile...');
      add(const LoadUserProfileEvent());
    } else {
      print('❌ AuthBloc: User is not authenticated');
      emit(const Unauthenticated());
    }
  }

  Future<void> _onSendOTP(
    SendOTPEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    final response = await _authService.sendOTP(event.mobileNumber);

    response.when(
      success: (_) {
        emit(OTPSent(event.mobileNumber));
      },
      failure: (error) {
        emit(AuthError(message: error.message));
      },
    );
  }

  Future<void> _onVerifyOTP(
    VerifyOTPEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    final response = await _authService.verifyOTP(
      mobileNumber: event.mobileNumber,
      otp: event.otp,
    );

    await response.when(
      success: (authData) async {
        // Check if emitter is still active
        if (emit.isDone) return;
        
        // Save authentication data to SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        
        // ✅ CRITICAL: Save token and login status
        await prefs.setString('token', authData.token);
        await prefs.setBool('isLoggedIn', true);
        
        // Also update global token variable for backward compatibility
        token = authData.token;
        
        // Save user data for later use
        await prefs.setString('mobileNumber', authData.user.mobileNumber);
        if (authData.user.name != null && authData.user.name!.isNotEmpty) {
          await prefs.setString('userName', authData.user.name!);
        }
        if (authData.user.email != null && authData.user.email!.isNotEmpty) {
          await prefs.setString('userEmail', authData.user.email!);
        }
        
        print('✅ Token saved to SharedPreferences');
        print('✅ Token saved to global variable');
        print('✅ Login status saved: true');
        print('✅ Mobile saved: ${authData.user.mobileNumber}');
        
        // Check again before emitting
        if (!emit.isDone) {
          emit(Authenticated(
            token: authData.token,
            user: authData.user,
            message: 'Login successful',
          ));
        }
      },
      failure: (error) async {
        // Check if emitter is still active
        if (!emit.isDone) {
          emit(AuthError(message: error.message));
        }
      },
    );
  }

  Future<void> _onResendOTP(
    ResendOTPEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    final response = await _authService.resendOTP(event.mobileNumber);

    response.when(
      success: (_) {
        emit(OTPResent(event.mobileNumber));
      },
      failure: (error) {
        emit(AuthError(message: error.message));
      },
    );
  }

  Future<void> _onLoadUserProfile(
    LoadUserProfileEvent event,
    Emitter<AuthState> emit,
  ) async {
    print('📱 AuthBloc: Loading user profile...');
    emit(const AuthLoading());

    final response = await _profileService.getProfile();

    response.when(
      success: (user) {
        print('✅ AuthBloc: Profile loaded successfully - ${user.name}');
        emit(Authenticated(user: user));
      },
      failure: (error) {
        print('❌ AuthBloc: Failed to load profile - ${error.message}');
        emit(AuthError(message: error.message));
      },
    );
  }

  Future<void> _onUpdateProfile(
    UpdateProfileEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    final response = await _profileService.updateProfile(
      name: event.name,
      email: event.email,
      profileImage: event.profileImage,
    );

    response.when(
      success: (user) {
        emit(ProfileUpdated(user));
      },
      failure: (error) {
        emit(AuthError(message: error.message));
      },
    );
  }

  Future<void> _onLogout(
    LogoutEvent event,
    Emitter<AuthState> emit,
  ) async {
    await _authService.logout();
    emit(const Unauthenticated());
  }

  void _onClearError(
    ClearAuthErrorEvent event,
    Emitter<AuthState> emit,
  ) {
    emit(const AuthInitial());
  }

  Future<void> _onUploadProfileImage(
    UploadProfileImageEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    final response = await _profileService.uploadProfileImage(event.filePath);

    await response.when(
      success: (_) async {
        final profileResponse = await _profileService.getProfile();

        profileResponse.when(
          success: (user) {
            emit(ProfileUpdated(user));
          },
          failure: (error) {
            emit(AuthError(message: error.message));
          },
        );
      },
      failure: (error) async {
        emit(AuthError(message: error.message));
      },
    );
  }
}
