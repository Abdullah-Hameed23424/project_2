import 'dart:convert';

import 'package:project_2/core/localization/language_constraints.dart'
    as AppConstants;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// [AppLocalization]
/// A class that provides localization support for the application.
class AppLocalization {
  AppLocalization(this.locale);

  final Locale locale;

  static AppLocalization of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization)!;
  }

  late Map<String, dynamic> _localizedValues;

  Future<void> load() async {
    final String jsonStringValues = await rootBundle.loadString(
      'assets/language/${locale.languageCode}.json',
    );
    _localizedValues = json.decode(jsonStringValues) as Map<String, dynamic>;
  }

  dynamic operator [](String key) => _getValue(key);

  dynamic _getValue(String key) {
    if (key.isEmpty) return null;

    if (!key.contains('.')) {
      return _localizedValues[key];
    }

    dynamic current = _localizedValues;
    for (final part in key.split('.')) {
      if (current is Map<String, dynamic> && current.containsKey(part)) {
        current = current[part];
      } else {
        return null;
      }
    }
    return current;
  }

  String translate(String key) {
    final dynamic value = _getValue(key);
    if (value is String) {
      return value;
    }
    if (value != null) {
      return value.toString();
    }
    return '{$key} check your key ^-^';
  }

  static const LocalizationsDelegate<AppLocalization> delegate =
      _DemoLocalizationsDelegate();
}

class _DemoLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalization> {
  const _DemoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final List<String> languageString = [];
    for (var language in AppConstants.languages) {
      languageString.add(language.languageCode);
    }
    return languageString.contains(locale.languageCode);
  }

  @override
  Future<AppLocalization> load(Locale locale) async {
    final AppLocalization localization = AppLocalization(locale);
    await localization.load();
    return localization;
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalization> old) => true;
}
