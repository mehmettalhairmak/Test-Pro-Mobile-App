import 'package:test_pro_mobile_app/models/user_model.dart';

abstract class DBBase {
  Future<bool> saveUser(UserModel user);
  Future<UserModel> readUser(String userID);
}
