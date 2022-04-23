// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_pro_mobile_app/app/pages/registration/signup/registration_signup_physical_page_weight.dart';
import 'package:test_pro_mobile_app/app/widgets/custom_back_button_widget.dart';
import 'package:test_pro_mobile_app/app/widgets/custom_button_widget.dart';
import 'package:test_pro_mobile_app/app/widgets/custom_horizontal_logo_widget.dart';
import 'package:test_pro_mobile_app/models/user_model_singleton.dart';

class SignUpPhysicalPageLenght extends StatelessWidget {
  SignUpPhysicalPageLenght({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  int _lenght = 0;

  @override
  Widget build(BuildContext context) {
    List items = [];

    for (var i = 0; i < 300; i++) {
      items.add(i.toString());
    }
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
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
              const Text("How much is your lenght?",
                  style: TextStyle(fontSize: 28)),
              SizedBox(
                height: 300,
                child: CupertinoPicker(
                  itemExtent: 64,
                  onSelectedItemChanged: (int value) {
                    _lenght = value;
                  },
                  children: items.map(
                    (item) {
                      return Center(
                        child: Text(item + "\t\t\tcm"),
                      );
                    },
                  ).toList(),
                ),
              ),
              const SizedBox(height: 150),
              CustomButtonWidget(
                width: 300,
                height: 60,
                buttonText: "Next",
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

  formSubmit(BuildContext context) {
    _formKey.currentState?.save();
    UserModelSingleton.setLenght(_lenght);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SignUpPhysicalPageWeight(),
      ),
    );
  }
}
