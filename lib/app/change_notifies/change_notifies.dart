import 'package:flutter/material.dart';

class User with ChangeNotifier {
  String _user = '';
  String get user => _user;

  set setUser(String name) {
    _user = name;
    notifyListeners();
  }
}