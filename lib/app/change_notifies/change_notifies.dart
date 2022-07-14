import 'package:flutter/material.dart';
import 'dart:io';

class LanguageChangeProvider with ChangeNotifier {
  Locale _currentLocale = Locale(Platform.localeName.substring(0,Platform.localeName.length - 3));
  Locale get currentLocale => _currentLocale;

  void changeLocale(String locale) {
    _currentLocale = Locale(locale);
    notifyListeners();
  }
}