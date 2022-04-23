// ignore_for_file: constant_identifier_names

import 'package:test_pro_mobile_app/models/user_model.dart';
import 'package:test_pro_mobile_app/locator.dart';
import 'package:test_pro_mobile_app/services/authentication/authentication_base.dart';
import 'package:test_pro_mobile_app/services/authentication/fake_auth.dart';
import 'package:test_pro_mobile_app/services/authentication/firebase_auth.dart';
import 'package:test_pro_mobile_app/services/database/firestore_db.dart';

enum AppMode { DEBUG, RELEASE }

class Repository implements AuthBase {
  final FirebaseAuthService _firebaseAuthService =
      locator<FirebaseAuthService>();

  final FakeAuthenticationService _fakeAuthenticationService =
      locator<FakeAuthenticationService>();

  final FirestoreDBService _firestoreDBService = locator<FirestoreDBService>();

  AppMode appMode = AppMode.RELEASE;



  @override
  Future<UserModel?> signInAnonymously() async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuthenticationService.signInAnonymously();
    } else {
      return await _firebaseAuthService.signInAnonymously();
    }
  }

  @override
  Future<bool> signOut() async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuthenticationService.signOut();
    } else {
      return await _firebaseAuthService.signOut();
    }
  }

  @override
  Future<UserModel?> signInWithEmailPassword(
      String email, String password) async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuthenticationService.signInWithEmailPassword(
          email, password);
    } else {
      UserModel? _user =
          await _firebaseAuthService.signInWithEmailPassword(email, password);
      return _firestoreDBService.readUser(_user!.userID!);
    }
  }

  @override
  Future<UserModel?> signUpWithEmailPassword(
      String email, String password) async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuthenticationService.signUpWithEmailPassword(
          email, password);
    } else {
      UserModel? _user =
          await _firebaseAuthService.signUpWithEmailPassword(email, password);
      bool _sonuc = await _firestoreDBService.saveUser(_user!);
      if (_sonuc) {
        return await _firestoreDBService.readUser(_user.userID!);
      } else {
        return null;
      }
    }
  }
}
