import 'package:bloc/bloc.dart';
import 'package:feature_based_with_mvvm/core/api/network_client.dart';
import 'package:feature_based_with_mvvm/core/storage/app_storage.dart';
import 'package:flutter/material.dart';

part 'localization_state.dart';
/// [LocalizationCubit]
/// A Cubit class for managing localization state in the application.
class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit() : super(LocalizationInitial());

  Locale? _appLocale;

  Locale? get appLocale => _appLocale;

  void init() {
    if (AppStorage.hasLocale) {
      _appLocale = Locale(AppStorage.getLocale);
    } else {
      // Fallback to platform locale or 'ar' if unable to determine
      try {
        _appLocale = Locale(WidgetsBinding.instance.platformDispatcher.locale.languageCode);
      } catch (e) {
        _appLocale = const Locale('ar');
      }
      AppStorage.saveLocale(_appLocale?.languageCode ?? 'ar');
    }
    emit(InitDefaultLocaleState());
  }

  void changeLocale({required Locale locale}) async {
    if (locale.languageCode != _appLocale?.languageCode) {
      _appLocale = locale;
      AppStorage.saveLocale(locale.languageCode);
      await NetworkClient.init();
      emit(ChangeLocaleState());
    }
  }
}
