part of 'orders_cubit.dart';

@immutable
sealed class OrdersState {}

final class OrdersInitial extends OrdersState {}

final class OrdersLoadingState extends OrdersState {}

final class OrdersSuccessState extends OrdersState {}

final class OrdersErrorState extends OrdersState {
  final String message;

  OrdersErrorState({required this.message});
}
