import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_pro_mobile_app/models/user_model.dart';
import 'package:test_pro_mobile_app/services/authentication/authentication_base.dart';

class FirebaseAuthService implements AuthBase {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  UserModel? _userFromFirebase(User? user) {
    if (user == null) {
      return null;
    } else {
      return UserModel(
        userID: user.uid,
        //email: user.email!,
      );
    }
  }


  @override
  Future<bool> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return true;
    } catch (e) {
      debugPrint("HATA SIGN OUT ${e.toString()}");
      return false;
    }
  }

  @override
  Future<UserModel?> signInAnonymously() async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInAnonymously();
      return _userFromFirebase(userCredential.user);
    } catch (e) {
      debugPrint("HATA ANONYMOUSLY SIGNIN ${e.toString()}");
      return null;
    }
  }

  @override
  Future<UserModel?> signInWithEmailPassword(
      String email, String password) async {
    UserCredential userCredential = await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    return _userFromFirebase(userCredential.user);
  }

  @override
  Future<UserModel?> signUpWithEmailPassword(
      String email, String password) async {
    UserCredential userCredential = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    return _userFromFirebase(userCredential.user);
  }
}
