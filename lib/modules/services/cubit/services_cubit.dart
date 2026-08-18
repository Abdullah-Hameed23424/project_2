import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:project_2/core/api/api_endpoints.dart';
import 'package:project_2/core/api/network_client.dart';
import 'package:project_2/core/error/error_handler/exception_handler.dart';
import 'package:project_2/modules/services/models/categories_response.dart';
import 'package:project_2/modules/services/models/category_data.dart';

part 'services_state.dart';

class ServicesCubit extends Cubit<ServicesState> {
  ServicesCubit() : super(ServicesInitial());

  Future<void> getCategories() async {
    emit(CategoriesLoading());
    try {
      final Response<dynamic> response = await NetworkClient.get(
        url: ApiEndpoints.categories,
      );

      if (isClosed) return;
      emit(
        CategoriesSuccess(
          categoriesResponse: CategoriesResponse.fromJson(response.data),
        ),
      );
    } catch (e, s) {
      if (isClosed) return;
      logApiName('getCategories');
      emit(CategoriesError(message: handleError(e, stackTrace: s)));
    }
  }

  Future<void> getServices({required int categoryId}) async {
    emit(ServicesLoading());

    try {
      final Response<dynamic> response = await NetworkClient.get(
        url: ApiEndpoints.categories,
      );

      if (isClosed) return;
      final CategoriesResponse categoriesResponse = CategoriesResponse.fromJson(
        response.data,
      );

      final CategoryData? category = categoriesResponse.data
          .cast<CategoryData?>()
          .firstWhere(
            (category) => category?.id == categoryId,
            orElse: () => null,
          );

      emit(
        ServicesSuccess(
          children: category?.children ?? [],
          catName: category?.name ?? '',
        ),
      );
    } catch (e, s) {
      if (isClosed) return;
      logApiName('getServices');
      emit(ServicesError(message: handleError(e, stackTrace: s)));
    }
  }
}
