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

class UserProvider with ChangeNotifier {
  bool _keepLogin = false;
  bool get keepLogin => _keepLogin;
  bool _emailMe = false;
  bool get emailMe => _emailMe;
  set keepLogin(bool value) {
    _keepLogin = value;
    notifyListeners();
  }
  set emailMe(bool value) {
    _emailMe = value;
    notifyListeners();
  }
}