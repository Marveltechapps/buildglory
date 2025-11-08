import 'dart:convert';

import 'package:buildglory/constant/constant.dart';
import 'package:buildglory/final/login/bloc/login_event.dart';
import 'package:buildglory/final/login/bloc/login_state.dart';
import 'package:buildglory/final/login/model/sendotp_response_model.dart';
import 'package:buildglory/final/login/model/verifyotp_response_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:buildglory/api/apiservice.dart' as api;

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<SendOtpApiEvent>(sendotp);
    on<VerifyOtpApiEvent>(verifyotp);
    on<SharedPreferenceEvent>(saveinsharedpreference);
  }

  saveinsharedpreference(
    SharedPreferenceEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoadingState());

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    await prefs.setString('token', event.token);
    emit(SharedPreferenceSavedState(token: event.token));
  }

  sendotp(SendOtpApiEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoadingState());
    try {
      String url = "${baseUrl}api/signin/send-otp";
      debugPrint(url);
      api.Response response = await api.ApiService().postRequest(
        url,
        json.encode({"mobileNumber": event.mobilenumber}),
      );
      if (response.statusCode == 200) {
        var sendOtpResponseModel = sendOtpResponseModelFromJson(
          response.resBody,
        );
        emit(
          SendApiOtpSuccessState(sendOtpResponseModel: sendOtpResponseModel),
        );
      } else {
        emit(LoginErrorState(errorMsg: response.resBody));
      }
    } catch (e) {
      emit(LoginErrorState(errorMsg: ""));
    }
  }

  verifyotp(VerifyOtpApiEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoadingState());
    try {
      String url = "${baseUrl}api/signin/verify-otp";
      debugPrint(url);
      api.Response response = await api.ApiService().postRequest(
        url,
        json.encode({
          "mobileNumber": event.mobilenumber,
          "enteredOTP": event.otpvalue,
        }),
      );
      if (response.statusCode == 200) {
        var verifyOtpResponseModel = verifyOtpResponseModelFromJson(
          response.resBody,
        );
        emit(
          VerifyApiOtpSuccessState(
            verifyOtpResponseModel: verifyOtpResponseModel,
          ),
        );
      } else {
        emit(LoginErrorState(errorMsg: response.resBody));
      }
    } catch (e) {
      emit(LoginErrorState(errorMsg: ""));
    }
  }
}
