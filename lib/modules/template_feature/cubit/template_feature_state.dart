part of './template_feature_cubit.dart';

sealed class TemplateFeatureState extends Equatable {
  const TemplateFeatureState();

  @override
  List<Object?> get props => [];
}

final class TemplateFeatureInitial extends TemplateFeatureState {}

/// [TEMPLATE_FEATURE] is loading
final class TemplateFeatureLoading extends TemplateFeatureState {}

final class TemplateFeatureSuccess extends TemplateFeatureState {
  final Object testObject;
  const TemplateFeatureSuccess({required this.testObject});

  @override
  List<Object?> get props => [testObject];
}

final class TemplateFeatureError extends TemplateFeatureState {
  final String message;
  const TemplateFeatureError({required this.message});

  @override
  List<Object?> get props => [message];
}
