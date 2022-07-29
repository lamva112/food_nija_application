import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:food_nija_application/data/models/user.dart';
class AuthService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  User? _userFromFirebase(auth.User? user) {
    if(user == null) {
      return null;
    } else {
      return User(uid: user.uid);
    }
  }
  Stream<User?>? get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  Future<User?> signInAnonymous() async{
    final credentinal = await _firebaseAuth.signInAnonymously();
    return _userFromFirebase(credentinal.user);
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
