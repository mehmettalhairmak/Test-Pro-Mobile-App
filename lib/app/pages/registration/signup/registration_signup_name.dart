import 'package:flutter/material.dart';
import 'package:test_pro_mobile_app/app/pages/registration/signup/registration_signup_sex.dart';
import 'package:test_pro_mobile_app/app/widgets/custom_back_button_widget.dart';
import 'package:test_pro_mobile_app/app/widgets/custom_button_widget.dart';
import 'package:test_pro_mobile_app/models/user_model.dart';
import 'package:test_pro_mobile_app/models/user_model_singleton.dart';

class SignUpNamePage extends StatefulWidget {
  const SignUpNamePage({Key? key}) : super(key: key);

  @override
  State<SignUpNamePage> createState() => _SignUpNamePageState();
}

class _SignUpNamePageState extends State<SignUpNamePage> {
  final _formKey = GlobalKey<FormState>();
  late UserModel userModel = UserModel();
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 40),
                Row(
                  children: const [
                    CustomBackButtonWidget(),
                  ],
                ),
                const SizedBox(height: 170),
                Row(
                  children: [
                    const SizedBox(width: 10),
                    Text(
                      "Your Name?",
                      style: TextStyle(fontSize: 46, color: Colors.grey[800]),
                    ),
                  ],
                ),
                const SizedBox(height: 100),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: "Your Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16)),
                    ),
                  ),
                ),
                const SizedBox(height: 255),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: CustomButtonWidget(
                    width: 300,
                    height: 60,
                    buttonText: "Contiune",
                    textFontSize: 18,
                    buttonColor: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () => formSubmit(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  formSubmit() {
    _formKey.currentState?.save();

    if (_nameController.text != "") {
      UserModelSingleton.setName(_nameController.text);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const SignUpSexPage(),
        ),
      );
      debugPrint(UserModelSingleton.getName());
    } else {
      showDialog(
          context: context,
          builder: (context) => const Text("İsim boş kalamaz"));
    }
  }
}
