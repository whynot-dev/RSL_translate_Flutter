import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  Locale locale;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  static String _getFormattedString(String string, List<String> inserts) {
    String newString = string;
    inserts.forEach((insert) {
      newString = newString.replaceFirst('{\$}', insert);
    });
    return newString;
  }

  Map<String, String> _localizedStrings = {};

  Future<bool> load() async {
    String? jsonString;
    try {
      jsonString = await rootBundle.loadString('assets/i18n/${locale.languageCode}.json');
    } catch (e) {}
    if (jsonString != null) {
      Map<String, dynamic> jsonMap = json.decode(jsonString);

      _localizedStrings = jsonMap.map((key, value) {
        return MapEntry(key, value.toString());
      });
    }

    return true;
  }

  String get translator => _localizedStrings['translator'] ?? '';
  String get currentGesture => _localizedStrings['currentGesture'] ?? '';
  String get lastFiveGestures => _localizedStrings['lastFiveGestures'] ?? '';
  String get education => _localizedStrings['education'] ?? '';
  String get lesson => _localizedStrings['lesson'] ?? '';
  String get start => _localizedStrings['start'] ?? '';
  String get stop => _localizedStrings['stop'] ?? '';

}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['ru', 'en', 'de'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = new AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
