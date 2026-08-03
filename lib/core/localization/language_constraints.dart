import 'package:project_2/core/constants/app_icons.dart';
import 'package:project_2/core/localization/app_localization.dart';
import 'package:project_2/core/localization/custom_delegate.dart';
import 'package:project_2/core/localization/language_model.dart';
import 'package:flutter/material.dart';

String translate(String key, BuildContext context, {List<String>? args}) {
  String translation = AppLocalization.of(context).translate(key);

  if (args != null) {
    for (int i = 0; i < args.length; i++) {
      translation = translation.replaceAll('{$i}', args[i]);
    }
  }
  return translation;
}

final List<LanguageModel> languages = [
  LanguageModel(languageName: 'English', languageCode: 'en', flag: AppIcons.gb),
  LanguageModel(languageName: 'العربية', languageCode: 'ar', flag: AppIcons.ar),
];

List<LocalizationsDelegate<dynamic>> localizationsDelegates = [
  AppLocalization.delegate,
  // GlobalMaterialLocalizations.delegate, // TODO need to check if this is necessary and fix the error with it
  // GlobalWidgetsLocalizations.delegate,
  // GlobalCupertinoLocalizations.delegate,
  FallbackLocalizationDelegate(),
];
