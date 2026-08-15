part of 'profile_cubit.dart';

@immutable
sealed class ProfileState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileSuccess extends ProfileState {
  final ProfileResponse profileResponse;
  ProfileSuccess({required this.profileResponse});

  @override
  List<Object?> get props => [profileResponse];
}

final class ProfileError extends ProfileState {
  final String message;
  ProfileError({required this.message});

  @override
  List<Object?> get props => [message];
}
