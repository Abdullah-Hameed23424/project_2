import 'package:equatable/equatable.dart';
import 'package:feature_based_with_mvvm/core/api/api_endpoints.dart';
import 'package:feature_based_with_mvvm/core/api/network_client.dart';
import 'package:feature_based_with_mvvm/core/error/error_handler/exception_handler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part './template_feature_state.dart';

class TemplateFeatureCubit extends Cubit<TemplateFeatureState> {
  TemplateFeatureCubit() : super(TemplateFeatureInitial());

  Future<void> templateFunction({required Object testParameter}) async {
    try {
      emit(TemplateFeatureLoading());

      final Map<String, dynamic> data = {'testParameterQuery': testParameter};

      // ignore: unused_local_variable
      final response = await NetworkClient.post(
        url: ApiEndpoints.testEndpoint,
        data: data,
      );

      if (isClosed) return;
      emit(TemplateFeatureSuccess(testObject: ''));
    } catch (e) {
      if (isClosed) return;
      emit(TemplateFeatureError(message: handleError(e)));
    }
  }
}
