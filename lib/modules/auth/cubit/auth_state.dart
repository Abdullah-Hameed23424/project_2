part of 'auth_cubit.dart';

@immutable
sealed class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthLoadingState extends AuthState {}

final class AuthSuccessState extends AuthState {}

final class AuthErrorState extends AuthState {
  final String message;

  AuthErrorState({required this.message});
}

/// [LoginScreen] @lib/modules/auth/view/screens/login_screen.dart
final class LoginLoading extends AuthState {}

final class LoginSuccess extends AuthState {}

final class LoginError extends AuthState {
  final String message;

  LoginError({required this.message});
  @override
  List<Object?> get props => [message];
}

/// [ForgetPasswdScreen] @lib/modules/auth/view/screens/forget_passwd_screen.dart
final class ForgetPasswdLoading extends AuthState {}

final class ForgetPasswdSuccess extends AuthState {}

final class ForgetPasswdError extends AuthState {
  final String message;

  ForgetPasswdError({required this.message});
  @override
  List<Object?> get props => [message];
}
