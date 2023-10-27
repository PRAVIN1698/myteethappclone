import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myteethpractice/screens/auth/authscreen.dart';
import 'package:myteethpractice/screens/splash.dart';

enum AuthServiceState {
  Intro,
  Starting,
  SignedIn,
  SignedOut,
  SignedddOut,
  Error
}

class AuthService extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  static AuthServiceState _authState =
      AuthServiceState.Intro; // Change initial state to Intro
  AuthServiceState get authState => _authState;

  AuthService() {
    _auth.authStateChanges().listen((User? user) {
      if (user != null) {
        _authState = AuthServiceState.SignedIn;
      } else {
        _authState = AuthServiceState.SignedOut;
      }
      notifyListeners();
    });
  }

  void splashScreenTimingUp() async {
    print('caaaliing splash timing up');
    _authState = AuthServiceState.SignedddOut;
    if (_authState == AuthServiceState.SignedddOut) {
      await Future(() => const authscreen());
    }
    notifyListeners();
  }
}
