part of 'services_cubit.dart';

@immutable
sealed class ServicesState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class ServicesInitial extends ServicesState {}

final class CategoriesLoading extends ServicesState {}

final class CategoriesSuccess extends ServicesState {
  final CategoriesResponse categoriesResponse;
  CategoriesSuccess({required this.categoriesResponse});

  @override
  List<Object?> get props => [categoriesResponse];
}

final class CategoriesError extends ServicesState {
  final String message;
  CategoriesError({required this.message});

  @override
  List<Object?> get props => [message];
}
