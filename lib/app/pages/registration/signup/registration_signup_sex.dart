import 'package:flutter/material.dart';
import 'package:test_pro_mobile_app/app/pages/registration/signup/registration_signup_physical_page_age.dart';
import 'package:test_pro_mobile_app/app/widgets/custom_back_button_widget.dart';
import 'package:test_pro_mobile_app/app/widgets/custom_button_widget.dart';
import 'package:test_pro_mobile_app/app/widgets/custom_horizontal_logo_widget.dart';
import 'package:test_pro_mobile_app/app/widgets/custom_sex_button_widget.dart';
import 'package:test_pro_mobile_app/models/user_model_singleton.dart';

class SignUpSexPage extends StatefulWidget {
  const SignUpSexPage({Key? key}) : super(key: key);

  @override
  State<SignUpSexPage> createState() => _SignUpSexPageState();
}

class _SignUpSexPageState extends State<SignUpSexPage> {
  int _value = 1;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
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
              const SizedBox(height: 160),
              const Text(
                "What is your sex?",
                style: TextStyle(fontSize: 28),
              ),
              const SizedBox(height: 100),
              Row(
                children: [
                  Expanded(
                    child: CustomSexButtonWidget(
                      buttonText: "Woman",
                      icon: Icons.female,
                      iconColor: Colors.pink,
                      value: 1,
                      groupValue: _value,
                      onChanged: (value) => setState(() {
                        _value = value!;
                        debugPrint(_value.toString());
                      }),
                    ),
                  ),
                  Expanded(
                    child: CustomSexButtonWidget(
                      buttonText: "Men",
                      icon: Icons.male,
                      iconColor: Colors.blue,
                      value: 2,
                      groupValue: _value,
                      onChanged: (value) => setState(() {
                        _value = value!;
                        debugPrint("2 : " + _value.toString());
                      }),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 145),
              CustomButtonWidget(
                width: 300,
                height: 60,
                buttonText: "Next",
                textFontSize: 18,
                buttonColor: Colors.blue,
                textColor: Colors.white,
                onPressed: () => formSubmit(_value),
              ),
            ],
          ),
        ),
      ),
    );
  }

  formSubmit(int _value) {
    _formKey.currentState?.save();

    if (_value == 1) {
      UserModelSingleton.setSex("Woman");
    } else if (_value == 2) {
      UserModelSingleton.setSex("Men");
    }
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SignUpPhysicalPageAge(),
      ),
    );
  }
}
