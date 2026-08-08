import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:project_2/core/api/api_endpoints.dart';
import 'package:project_2/core/api/network_client.dart';
import 'package:project_2/core/error/error_handler/exception_handler.dart';
import 'package:project_2/core/storage/app_storage.dart';

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
}
