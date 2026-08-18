import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:project_2/core/api/api_endpoints.dart';
import 'package:project_2/core/api/network_client.dart';
import 'package:project_2/core/error/error_handler/exception_handler.dart';
import 'package:project_2/core/storage/app_storage.dart';
import 'package:project_2/modules/auth/models/otp_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> login({
    required String phoneNumber,
    required String password,
  }) async {
    emit(LoginLoading());
    try {
      final response = await NetworkClient.post(
        url: ApiEndpoints.login,
        data: json.encode({'phone': phoneNumber, 'password': password}),
      );

      final String token = (response.data['token']);
      await AppStorage.saveToken(token);
      NetworkClient.updateAuthToken(token);

      final int? userId = (response.data['user']['id']);
      if (userId != null) {
        await AppStorage.saveMyId(userId);
      }

      if (isClosed) return;
      emit(LoginSuccess());
    } catch (e, s) {
      if (isClosed) return;
      logApiName('Login');
      emit(LoginError(message: handleError(e, stackTrace: s)));
    }
  }

  Future<void> forgetPasswd({required String phoneNumber}) async {
    emit(ForgetPasswdLoading());
    try {
      await NetworkClient.post(
        url: ApiEndpoints.forgetPasswd,
        data: json.encode({'phone': phoneNumber}),
      );

      if (isClosed) return;
      emit(ForgetPasswdSuccess());
    } catch (e, s) {
      if (isClosed) return;
      logApiName('ForgetPasswd');
      emit(ForgetPasswdError(message: handleError(e, stackTrace: s)));
    }
  }

  Future<void> verifyOtp({
    required String endPoint,
    required String phoneNumber,
    required String code,
  }) async {
    emit(VerifyOtpLoading());
    try {
      final response = await NetworkClient.post(
        url: '${ApiEndpoints.verifyOtp}/$endPoint',
        data: json.encode({'phone': phoneNumber, 'code': code}),
      );

      if (isClosed) return;
      emit(VerifyOtpSuccess(otpResponse: OtpResponse.fromJson(response.data)));
    } catch (e, s) {
      if (isClosed) return;
      logApiName('verifyOtp');
      emit(VerifyOtpError(message: handleError(e, stackTrace: s)));
    }
  }

  Future<void> resetPasswd({
    required String phoneNumber,
    required String ticket,
    required String passwd,
    required String confirmPasswd,
  }) async {
    emit(ResetPasswdLoading());
    try {
      await NetworkClient.post(
        url: ApiEndpoints.resetPasswd,
        data: json.encode({
          'phone': phoneNumber,
          'ticket': ticket,
          'password': passwd,
          'password_confirmation': confirmPasswd,
        }),
      );

      if (isClosed) return;
      emit(ResetPasswdSuccess());
    } catch (e, s) {
      if (isClosed) return;
      logApiName('resetPasswd');
      emit(ResetPasswdError(message: handleError(e, stackTrace: s)));
    }
  }

  Future<void> signUp({required String phoneNumber}) async {
    emit(SignUpLoading());
    try {
      await NetworkClient.post(
        url: ApiEndpoints.signUp,
        data: json.encode({'phone': phoneNumber}),
      );

      if (isClosed) return;
      emit(SignUpSuccess());
    } catch (e, s) {
      if (isClosed) return;
      logApiName('signUp');
      emit(SignUpError(message: handleError(e, stackTrace: s)));
    }
  }

  Future<void> completeSignUpInfo({
    required String phoneNumber,
    required String fullName,
    required String passwd,
    required String confirmPasswd,
    required String ticket,
  }) async {
    emit(CompleteSignUpLoading());
    try {
      await NetworkClient.post(
        url: ApiEndpoints.completeSignUpInfo,
        data: json.encode({
          'phone': phoneNumber,
          'name': fullName,
          'password': passwd,
          'password_confirmation': confirmPasswd,
          'ticket': ticket,
        }),
      );

      if (isClosed) return;
      emit(CompleteSignUpSuccess());
    } catch (e, s) {
      if (isClosed) return;
      logApiName('completeSignUp');
      emit(CompleteSignUpError(message: handleError(e, stackTrace: s)));
    }
  }

  Future<void> logout() async {
    emit(LogoutLoading());
    try {
      await NetworkClient.post(url: ApiEndpoints.logout);
      AppStorage.removeToken();
      AppStorage.removeMyId();

      if (isClosed) return;
      emit(LogoutSuccess());
    } catch (e, s) {
      if (isClosed) return;
      logApiName('logout');
      emit(LogoutError(message: handleError(e, stackTrace: s)));
    }
  }
}
