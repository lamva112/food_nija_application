import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_nija_application/data/services/could_store_method.dart';

import '../../data/models/user.dart';

class UserProvider with ChangeNotifier {
  Users? _user;
  final CloudStoreDataManagement _authMethods = CloudStoreDataManagement();

  Users get getUser => _user!;

  Future<void> refreshUser() async {
    Users user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
