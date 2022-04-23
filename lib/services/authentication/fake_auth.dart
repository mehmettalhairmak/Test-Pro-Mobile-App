import 'package:test_pro_mobile_app/models/user_model.dart';
import 'package:test_pro_mobile_app/services/authentication/authentication_base.dart';

class FakeAuthenticationService implements AuthBase {
  String userID = "123123123123";

  @override
  Future<bool> signOut() {
    return Future.value(true);
  }

  @override
  Future<UserModel?> signInAnonymously() async {
    return await Future.delayed(
      const Duration(seconds: 5),
      () => UserModel(
          userID: userID,
          email: 'fakeuser@fake.com',
          age: null,
          lenght: null,
          name: '',
          password: '',
          sex: '',
          weight: null),
    );
  }

  @override
  Future<UserModel?> signInWithEmailPassword(
      String email, String password) async {
    return await Future.delayed(
        const Duration(seconds: 2),
        () => UserModel(
            userID: 'signup_user_id_123456',
            email: 'fakeuser@fake.com',
            age: null,
            lenght: null,
            name: '',
            password: '',
            sex: '',
            weight: null));
  }

  @override
  Future<UserModel?> signUpWithEmailPassword(
      String email, String password) async {
    return await Future.delayed(
        const Duration(seconds: 2),
        () => UserModel(
            userID: 'signin_user_id_123456',
            email: 'fakeuser@fake.com',
            age: null,
            lenght: null,
            name: '',
            password: '',
            sex: '',
            weight: null));
  }
}
