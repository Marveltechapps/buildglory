import 'package:flutter_bloc/flutter_bloc.dart';
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
    on<ClearAuthErrorEvent>(_onClearError);

    // Check auth status on initialization
    add(const CheckAuthStatusEvent());
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

    response.when(
      success: (authData) {
        emit(Authenticated(
          user: authData.user,
          message: 'Login successful',
        ));
      },
      failure: (error) {
        emit(AuthError(message: error.message));
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
}

