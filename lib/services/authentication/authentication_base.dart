import 'package:test_pro_mobile_app/models/user_model.dart';

abstract class AuthBase {
  Future<UserModel?> signInAnonymously();
  Future<UserModel?> signInWithEmailPassword(String email, String password);
  Future<UserModel?> signUpWithEmailPassword(String email, String password);
  Future<bool> signOut();
}
