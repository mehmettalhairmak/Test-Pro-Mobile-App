// ignore_for_file: must_be_immutable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_pro_mobile_app/app/pages/home_page.dart';
import 'package:test_pro_mobile_app/app/pages/welcome.dart';
import 'package:test_pro_mobile_app/app/widgets/custom_back_button_widget.dart';
import 'package:test_pro_mobile_app/app/widgets/custom_button_widget.dart';
import 'package:test_pro_mobile_app/app/widgets/custom_horizontal_logo_widget.dart';
import 'package:test_pro_mobile_app/models/user_model.dart';
import 'package:test_pro_mobile_app/models/user_model_singleton.dart';
import 'package:test_pro_mobile_app/viewmodel/view_model.dart';

class SignUpPhysicalPageWeight extends StatelessWidget {
  SignUpPhysicalPageWeight({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  int _weight = 0;

  @override
  Widget build(BuildContext context) {
    List items = [];

    for (var i = 0; i < 300; i++) {
      items.add(i.toString());
    }

    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CustomBackButtonWidget(),
                  CustomHorizontalLogoWidget(),
                  SizedBox(height: 30, width: 30)
                ],
              ),
              const SizedBox(height: 150),
              const Text("How much is your weight?",
                  style: TextStyle(fontSize: 28)),
              SizedBox(
                height: 300,
                child: CupertinoPicker(
                  itemExtent: 64,
                  onSelectedItemChanged: (int value) {
                    _weight = value;
                  },
                  children: items.map(
                    (item) {
                      return Center(
                        child: Text(item + "\t\t\tkg"),
                      );
                    },
                  ).toList(),
                ),
              ),
              const SizedBox(height: 150),
              CustomButtonWidget(
                width: 300,
                height: 60,
                buttonText: "Finish",
                textFontSize: 18,
                buttonColor: Colors.blue,
                textColor: Colors.white,
                onPressed: () => formSubmit(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  formSubmit(BuildContext context) async {
    _formKey.currentState?.save();
    final _viewModel = Provider.of<ViewModel>(context, listen: false);
    UserModelSingleton.setWeight(_weight);

    UserModel userModel = UserModel(
      email: UserModelSingleton.getEmail(),
      password: UserModelSingleton.getPassword(),
    );

    try {
      UserModel? _currentUser = await _viewModel.signUpWithEmailPassword(
          userModel.email!, userModel.password!);
      if (_currentUser != null) {
        debugPrint('Oturum Açan User ID : ${_currentUser.userID.toString()}');

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => WelcomePage(user: _currentUser),
          ),
          (route) => false,
        );
      } else {
        debugPrint("_currentUser = null");
      }
    } on FirebaseAuthException catch (e) {
      debugPrint("Widget Oturum Açma Hata Yakalandı ${e.code.toString()}");

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Sign Up Error"),
          content: const Text(
              "This email address is already in use, please use a different email address"),
          actions: [
            ElevatedButton(
              child: const Text("OK"),
              onPressed: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
                (route) => false,
              ),
            ),
          ],
        ),
      );
    }
  }
}
