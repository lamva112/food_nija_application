import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:food_nija_application/data/models/user.dart';

class AuthService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  Users? _userFromFirebase(auth.User? user) {
    if (user == null) {
      return null;
    } else {
      return Users(uid: user.uid);
    }
  }

  Stream<Users?>? get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  Future<Users?> signInAnonymous() async {
    final credentinal = await _firebaseAuth.signInAnonymously();
    return _userFromFirebase(credentinal.user);
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }

  Future<Users?> signInEmailandPassword(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      final credentinal = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return _userFromFirebase(credentinal.user);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
      return null;
    }
  }

  Future<Users?> registerWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credentinal = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return _userFromFirebase(credentinal.user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
