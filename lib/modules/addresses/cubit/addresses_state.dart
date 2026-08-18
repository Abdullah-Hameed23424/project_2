part of 'addresses_cubit.dart';

@immutable
sealed class AddressesState {}

final class AddressesInitial extends AddressesState {}

final class AddressesLoadingState extends AddressesState {}

final class AddressesSuccessState extends AddressesState {}

final class AddressesErrorState extends AddressesState {
  final String message;

  AddressesErrorState({required this.message});
}
