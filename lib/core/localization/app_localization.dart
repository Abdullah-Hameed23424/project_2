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

  late Map<String, String> _localizedValues;

  Future<void> load() async {
    final String jsonStringValues = await rootBundle.loadString(
      'assets/language/${locale.languageCode}.json',
    );
    final Map<String, dynamic> mappedJson = json.decode(jsonStringValues);
    _localizedValues = _flattenMap(mappedJson);
  }

  Map<String, String> _flattenMap(
    Map<String, dynamic> map, [
    String prefix = '',
  ]) {
    final Map<String, String> result = {};
    map.forEach((key, value) {
      if (value is Map) {
        result.addAll(
          _flattenMap(Map<String, dynamic>.from(value), '$prefix$key.'),
        );
      } else {
        result['$prefix$key'] = value.toString();
      }
    });
    return result;
  }

  String translate(String key) {
    // print('key> $key value> ${_localizedValues[key]} ');

    return _localizedValues[key] ?? '{$key} check your key ^-^';
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
    // AppConstants.
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
