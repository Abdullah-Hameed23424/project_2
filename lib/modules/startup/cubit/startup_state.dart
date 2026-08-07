part of 'startup_cubit.dart';

@immutable
sealed class StartupState {}

final class StartupInitial extends StartupState {}

final class StartupLoadingState extends StartupState {}

final class StartupSuccessState extends StartupState {}

final class StartupErrorState extends StartupState {
  final String message;

  StartupErrorState({required this.message});
}
