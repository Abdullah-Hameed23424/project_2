class AppPeriods {
  static final Duration shortDuration = const Duration(milliseconds: 150);

  static Duration animationDelay(int multibleBy, {int baseDelay = 150}) =>
      Duration(milliseconds: baseDelay * multibleBy);
}
