import 'package:buildglory/constant/constant.dart';
import 'package:buildglory/final/login/bloc/login_event.dart';
import 'package:buildglory/final/login/bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:buildglory/final/login/model/sendotp_response_model.dart';
import 'package:buildglory/final/login/model/user_lookup_response_model.dart';
import 'package:buildglory/final/login/model/verifyotp_response_model.dart';
import 'package:buildglory/final/login/repository/auth_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({AuthRepository? authRepository})
      : _authRepository = authRepository ?? AuthRepository(),
        super(LoginInitialState()) {
    on<SendOtpApiEvent>(_sendOtp);
    on<ResendOtpApiEvent>(_resendOtp);
    on<VerifyOtpApiEvent>(_verifyOtp);
    on<LookupUserByMobileEvent>(_lookupUser);
    on<DeleteUserByMobileEvent>(_deleteUser);
    on<SharedPreferenceEvent>(_saveToken);
  }

  final AuthRepository _authRepository;

  Future<void> _saveToken(
    SharedPreferenceEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoadingState());

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('token', event.token);
      token = event.token;
      emit(SharedPreferenceSavedState(token: event.token));
    } catch (error) {
      emit(
        LoginErrorState(
          errorMsg: 'Unable to store credentials locally. Please try again.',
        ),
      );
    }
  }

  Future<void> _sendOtp(
    SendOtpApiEvent event,
    Emitter<LoginState> emit,
  ) async {
    await _execute(
      emit,
      () => _authRepository.sendOtp(event.mobilenumber),
      onSuccess: (SendOtpResponseModel response) =>
          SendApiOtpSuccessState(sendOtpResponseModel: response),
    );
  }

  Future<void> _resendOtp(
    ResendOtpApiEvent event,
    Emitter<LoginState> emit,
  ) async {
    await _execute(
      emit,
      () => _authRepository.resendOtp(event.mobilenumber),
      onSuccess: (SendOtpResponseModel response) =>
          ResendOtpSuccessState(resendOtpResponseModel: response),
    );
  }

  Future<void> _verifyOtp(
    VerifyOtpApiEvent event,
    Emitter<LoginState> emit,
  ) async {
    await _execute(
      emit,
      () => _authRepository.verifyOtp(
        mobileNumber: event.mobilenumber,
        otp: event.otpvalue,
      ),
      onSuccess: (VerifyOtpResponseModel response) =>
          VerifyApiOtpSuccessState(verifyOtpResponseModel: response),
    );
  }

  Future<void> _lookupUser(
    LookupUserByMobileEvent event,
    Emitter<LoginState> emit,
  ) async {
    await _execute(
      emit,
      () => _authRepository.getUserByMobile(event.mobileNumber),
      onSuccess: (UserLookupResponseModel response) =>
          UserLookupSuccessState(userLookupResponseModel: response),
    );
  }

  Future<void> _deleteUser(
    DeleteUserByMobileEvent event,
    Emitter<LoginState> emit,
  ) async {
    await _execute(
      emit,
      () => _authRepository.deleteUserByMobile(event.mobileNumber),
      onSuccess: (UserLookupResponseModel response) =>
          DeleteUserSuccessState(userLookupResponseModel: response),
    );
  }

  Future<void> _execute<T>(
    Emitter<LoginState> emit,
    Future<T> Function() action, {
    required LoginState Function(T data) onSuccess,
  }) async {
    emit(LoginLoadingState());
    try {
      final result = await action();
      emit(onSuccess(result));
    } on ApiException catch (error) {
      emit(LoginErrorState(errorMsg: error.message));
    } catch (_) {
      emit(LoginErrorState(errorMsg: 'Something went wrong. Please try again.'));
    }
  }
}
