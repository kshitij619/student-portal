import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class AuthService with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? _user;
  User? get user => _user;
  String? get email => _user?.email;

  AuthService() {
    _auth.authStateChanges().listen((User? user) {
      _user = user;
      notifyListeners();
    });
  }

  Future<void> signInWithEmail(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      throw 'Email or password is incorrect';
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
