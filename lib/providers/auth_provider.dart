import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/models/app_user.dart';
import 'package:myapp/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  AppUser? _user;

  AuthProvider() {
    AuthService.authStateChanges().listen(_onAuthStateChanged);
  }

  AppUser? get user => _user;

  void _onAuthStateChanged(User? firebaseUser) {
    if (firebaseUser != null) {
      _user = AppUser(uid: firebaseUser.uid, email: firebaseUser.email!);
      _user!.todoListTitle = 'User\'s To-Do List';
    } else {
      _user = null;
    }
    notifyListeners();
  }

  Future<void> signUp(String email, String password) async {
    final appUser = await AuthService.signUp(email, password);
    _user = appUser;
    notifyListeners();
  }

  Future<void> signIn(String email, String password) async {
    final appUser = await AuthService.signIn(email, password);
    _user = appUser;
    notifyListeners();
  }

  Future<void> signOut() async {
    await AuthService.signOut();
    _user = null;
    notifyListeners();
  }
}
