part of 'addresses_cubit.dart';

@immutable
sealed class AddressesState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class AddressesInitial extends AddressesState {}

final class AddressesLoading extends AddressesState {}

final class AddressesSuccess extends AddressesState {}

final class AddressesError extends AddressesState {
  final String message;

  AddressesError({required this.message});

  @override
  List<Object?> get props => [message];
}

final class DeleteAddressLoading extends AddressesState {}

final class DeleteAddressSuccess extends AddressesState {}

final class DeleteAddressError extends AddressesState {
  final String message;
  DeleteAddressError({required this.message});

  @override
  List<Object?> get props => [message];
}
