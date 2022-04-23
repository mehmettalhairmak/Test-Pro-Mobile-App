class UserModelSingleton {
  static String? userID;
  static String? email;
  static String? password;
  static String? name;
  static String? sex;
  static int? age;
  static int? lenght;
  static int? weight;

  static bool isUserIDSetSet = false;
  static bool isEmailSet = false;
  static bool isPasswordSet = false;
  static bool isNameSet = false;
  static bool isSexSet = false;
  static bool isAgeSet = false;
  static bool isLenghtSet = false;
  static bool isWeightSet = false;

  UserModelSingleton._internal();

  static final UserModelSingleton _userModelSingleton =
      UserModelSingleton._internal();

  factory UserModelSingleton() => _userModelSingleton;

  //SETTER

  static void setEmail(String _email) {
    email = _email;
    isEmailSet = true;
  }

  static void setPassword(String _password) {
    password = _password;
    isPasswordSet = true;
  }

  static void setName(String _name) {
    name = _name;
    isNameSet = true;
  }

  static void setSex(String _sex) {
    sex = _sex;
    isSexSet = true;
  }

  static void setAge(int _age) {
    age = _age;
    isAgeSet = true;
  }

  static void setLenght(int _lenght) {
    lenght = _lenght;
    isEmailSet = true;
  }

  static void setWeight(int _weight) {
    weight = _weight;
    isWeightSet = true;
  }

  //GETTER

  static String? getEmail() => email;

  static String? getPassword() => password;

  static String? getName() => name;

  static String? getSex() => sex;

  static int? getAge() => age;

  static int? getLenght() => lenght;

  static int? getWeight() => weight;

  /*UserModel({
    this.userID,
    this.email,
    this.password,
    this.name,
    this.sex,
    this.age,
    this.lenght,
    this.weight,
  });*/

  /*Map<String, dynamic> toMap() {
    return {
      'userID': userID,
      'email': email,
      'name': name,
      'password': password,
      'sex': sex,
      'age': age,
      'lenght': lenght,
      'weight': weight,
    };
  }*/

  /*UserModel.fromMap(Map<String, dynamic> map)
      : userID = map['userID'],
        email = map['email'],
        name = map['name'],
        password = map['password'],
        sex = map['sex'],
        age = map['age'],
        lenght = map['lenght'],
        weight = map['weight'];*/
}
