import 'package:test_pro_mobile_app/models/user_model_singleton.dart';

class UserModel {
  final String? userID;
  String? email;
  String? password;
  String? name;
  String? sex;
  int? age;
  int? lenght;
  int? weight;

  UserModel({
    this.userID,
    this.email,
    this.password,
    this.name,
    this.sex,
    this.age,
    this.lenght,
    this.weight,
  });

  Map<String, dynamic> toMap() {
    return {
      'userID': userID,
      'email': UserModelSingleton.getEmail(),
      'name': UserModelSingleton.getName(),
      'password': UserModelSingleton.getPassword(),
      'sex': UserModelSingleton.getSex(),
      'age': UserModelSingleton.getAge(),
      'lenght': UserModelSingleton.getLenght(),
      'weight': UserModelSingleton.getWeight(),
    };
  }

  UserModel.fromMap(Map<String, dynamic> map)
      : userID = map['userID'],
        email = map['email'],
        name = map['name'],
        password = map['password'],
        sex = map['sex'],
        age = map['age'],
        lenght = map['lenght'],
        weight = map['weight'];
}
