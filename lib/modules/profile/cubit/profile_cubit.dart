import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:project_2/core/api/api_endpoints.dart';
import 'package:project_2/core/api/network_client.dart';
import 'package:project_2/core/error/error_handler/exception_handler.dart';
import 'package:project_2/modules/profile/models/profile_response.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  Future<void> getProfile() async {
    emit(ProfileLoading());
    try {
      final Response<dynamic> response = await NetworkClient.get(
        url: ApiEndpoints.profile,
      );

      if (isClosed) return;
      emit(
        ProfileSuccess(
          profileResponse: ProfileResponse.fromJson(response.data),
        ),
      );
    } catch (e, s) {
      if (isClosed) return;
      logApiName('getProfile');
      emit(ProfileError(message: handleError(e, stackTrace: s)));
    }
  }
}
