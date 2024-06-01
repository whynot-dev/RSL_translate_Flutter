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

  String get error => _localizedStrings['error'] ?? '';
  String get cancel => _localizedStrings['cancel'] ?? '';
  String get travelSimply => _localizedStrings['travelSimply'] ?? '';
  String get ok => _localizedStrings['ok'] ?? '';
  String get cantGetData => _localizedStrings['cantGetData'] ?? '';
  String get cantGetGeoPermission => _localizedStrings['cantGetGeoPermission'] ?? '';
  String get checkYourInternetConnection => _localizedStrings['checkYourInternetConnection'] ?? '';
  String get checkYourGeoSettings => _localizedStrings['checkYourGeoSettings'] ?? '';
  String get somethingWentWrong => _localizedStrings['somethingWentWrong'] ?? '';
  String get selectThisAddress => _localizedStrings['selectThisAddress'] ?? '';
  String get routes  => _localizedStrings['routes'] ?? '';
  String get map  => _localizedStrings['map'] ?? '';
  String get createRoute  => _localizedStrings['createRoute'] ?? '';
  String get changeRoute  => _localizedStrings['changeRoute'] ?? '';
  String get monument  => _localizedStrings['monument'] ?? '';
  String get monuments  => _localizedStrings['monuments'] ?? '';
  String get historicalPlace  => _localizedStrings['historicalPlace'] ?? '';
  String get historicalPlaces  => _localizedStrings['historicalPlaces'] ?? '';
  String get religion  => _localizedStrings['religion'] ?? '';
  String get religions  => _localizedStrings['religions'] ?? '';
  String get museum  => _localizedStrings['museum'] ?? '';
  String get museums  => _localizedStrings['museums'] ?? '';
  String get zoo  => _localizedStrings['zoo'] ?? '';
  String get zoos  => _localizedStrings['zoos'] ?? '';
  String get theatre  => _localizedStrings['theatre'] ?? '';
  String get theatres  => _localizedStrings['theatres'] ?? '';
  String get square  => _localizedStrings['square'] ?? '';
  String get squares  => _localizedStrings['squares'] ?? '';
  String get sculpture  => _localizedStrings['sculpture'] ?? '';
  String get sculptures  => _localizedStrings['sculptures'] ?? '';
  String get fountain  => _localizedStrings['fountain'] ?? '';
  String get fountains  => _localizedStrings['fountains'] ?? '';
  String get park  => _localizedStrings['park'] ?? '';
  String get parks  => _localizedStrings['parks'] ?? '';
  String get natural  => _localizedStrings['natural'] ?? '';
  String get historicBuilding  => _localizedStrings['historicBuilding'] ?? '';
  String get historicBuildings  => _localizedStrings['historicBuildings'] ?? '';
  String get architecture  => _localizedStrings['architecture'] ?? '';
  String get apply  => _localizedStrings['apply'] ?? '';
  String get imInterested  => _localizedStrings['imInterested'] ?? '';
  String get buildingRoute  => _localizedStrings['buildingRoute'] ?? '';
  String get transport  => _localizedStrings['transport'] ?? '';
  String get pointDeparture  => _localizedStrings['pointDeparture'] ?? '';
  String get pointDestination  => _localizedStrings['pointDestination'] ?? '';
  String get delete  => _localizedStrings['delete'] ?? '';
  String get shorter  => _localizedStrings['shorter'] ?? '';
  String get moreInteresting  => _localizedStrings['moreInteresting'] ?? '';

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
