import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:project_2/core/api/api_endpoints.dart';
import 'package:project_2/core/api/network_client.dart';
import 'package:project_2/core/error/error_handler/exception_handler.dart';
import 'package:project_2/modules/orders/models/order_data.dart';
import 'package:project_2/modules/orders/models/order_response.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial());

  Future<void> getOrders({required String endpoint, String? filter}) async {
    emit(OrdersLoading());
    try {
      final Response<dynamic> response = await NetworkClient.get(
        url: endpoint,
        queryParameters: {'filter': filter},
      );

      if (isClosed) return;
      emit(OrdersSuccess(orderResponse: OrderResponse.fromJson(response.data)));
    } catch (e, s) {
      if (isClosed) return;
      logApiName('getOrders');
      emit(OrdersError(message: handleError(e, stackTrace: s)));
    }
  }

  Future<void> getOrderDetails({required int orderId}) async {
    emit(OrderLoading());
    try {
      final Response<dynamic> response = await NetworkClient.get(
        url: '${ApiEndpoints.orders}/$orderId',
      );

      if (isClosed) return;
      emit(OrderSuccess(orderData: OrderData.fromJson(response.data['data'])));
    } catch (e, s) {
      if (isClosed) return;
      logApiName('getOrderDetails');
      emit(OrderError(message: handleError(e, stackTrace: s)));
    }
  }
}
