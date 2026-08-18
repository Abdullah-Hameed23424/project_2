part of 'orders_cubit.dart';

@immutable
sealed class OrdersState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class OrdersInitial extends OrdersState {}

final class OrdersLoading extends OrdersState {}

final class OrdersSuccess extends OrdersState {
  final OrderResponse orderResponse;
  OrdersSuccess({required this.orderResponse});

  @override
  List<Object?> get props => [orderResponse];
}

final class OrdersError extends OrdersState {
  final String message;
  OrdersError({required this.message});

  @override
  List<Object?> get props => [message];
}

final class OrderLoading extends OrdersState {}

final class OrderSuccess extends OrdersState {
  final OrderData orderData;
  OrderSuccess({required this.orderData});

  @override
  List<Object?> get props => [orderData];
}

final class OrderError extends OrdersState {
  final String message;
  OrderError({required this.message});

  @override
  List<Object?> get props => [message];
}
