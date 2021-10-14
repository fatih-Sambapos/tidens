import 'package:flutter/material.dart';

import '../core_shelf.dart';

class LanguageProvider extends ChangeNotifier {
  Locale? _appLocale;
  String deviceLang = WidgetsBinding.instance!.window.locale.languageCode;

  Locale? get appLocal => _appLocale;

  Future<void> fetchLocale() async {
    var langCode = await LocalManager.instance
        .getStringValue(LocalManagerKeys.languageCode);
    _appLocale = Locale(langCode == 'Not Found'
        ? (AppLocalizations.supportedLocalesCode.contains(deviceLang)
            ? deviceLang
            : 'en')
        : langCode);
    await LocalManager.instance.setStringValue(
        LocalManagerKeys.languageCode, _appLocale!.languageCode);
    notifyListeners();
  }

  Future<void> changeLanguage(String type) async {
    if (Locale(type) == _appLocale ||
        (AppLocalizations.supportedLocalesCode.contains(type) == false)) return;
    _appLocale = Locale(type);
    await LocalManager.instance
        .setStringValue(LocalManagerKeys.languageCode, type);
    notifyListeners();
  }

  Future<String> getlang() async {
    var langCode = await LocalManager.instance
        .getStringValue(LocalManagerKeys.languageCode);
    return langCode;
  }
}
