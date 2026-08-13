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

/// [VerifyOtpScreen] @lib/modules/auth/view/screens/verify_otp_screen.dart
final class VerifyOtpLoading extends AuthState {}

final class VerifyOtpSuccess extends AuthState {
  final OtpResponse otpResponse;
  VerifyOtpSuccess({required this.otpResponse});

  @override
  List<Object?> get props => [otpResponse];
}

final class VerifyOtpError extends AuthState {
  final String message;
  VerifyOtpError({required this.message});

  @override
  List<Object?> get props => [message];
}

/// [ResetPasswdScreen] @lib/modules/auth/view/screens/reset_passwd_screen.dart
final class ResetPasswdLoading extends AuthState {}

final class ResetPasswdSuccess extends AuthState {}

final class ResetPasswdError extends AuthState {
  final String message;
  ResetPasswdError({required this.message});

  @override
  List<Object?> get props => [message];
}

/// [SignUpScreen] @lib/modules/auth/view/screens/sign_up_screen.dart
final class SignUpLoading extends AuthState {}

final class SignUpSuccess extends AuthState {}

final class SignUpError extends AuthState {
  final String message;

  SignUpError({required this.message});
  @override
  List<Object?> get props => [message];
}

/// [SignUpScreen] @lib/modules/auth/view/screens/sign_up_screen.dart
final class CompleteSignUpLoading extends AuthState {}

final class CompleteSignUpSuccess extends AuthState {}

final class CompleteSignUpError extends AuthState {
  final String message;

  CompleteSignUpError({required this.message});
  @override
  List<Object?> get props => [message];
}
