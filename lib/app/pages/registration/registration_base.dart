import 'package:flutter/material.dart';
import 'package:test_pro_mobile_app/app/pages/registration/signin/registration_signin.dart';
import 'package:test_pro_mobile_app/app/pages/registration/signup/registration_signup.dart';
import 'package:test_pro_mobile_app/app/widgets/custom_back_button_widget.dart';
import 'package:test_pro_mobile_app/app/widgets/switch_widget.dart';

// ignore: constant_identifier_names
enum FormType { SignUp, SignIn }

class RegisterBase extends StatefulWidget {
  const RegisterBase({Key? key}) : super(key: key);
  @override
  State<RegisterBase> createState() => _RegisterBaseState();
}

class _RegisterBaseState extends State<RegisterBase> {
  int? tabIndex = 0;
  var _formType = FormType.SignUp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  CustomBackButtonWidget(),
                ],
              ),
              const SizedBox(height: 30),
              SwitchWidget(
                initialLabelIndex: tabIndex!,
                onToggle: (index) {
                  tabIndex = index;
                  _changeFormType(index!);
                  debugPrint(_formType.toString());
                },
              ),
              const SizedBox(height: 50),
              buildRegistrationPage(_formType)
            ],
          ),
        ),
      ),
    );
  }

  buildRegistrationPage(FormType _formType) {
    return _formType == FormType.SignUp ? const SignUpPanel() :  const SignInPanel();
  }

  void _changeFormType(int index) => setState(
      () => _formType = index == 0 ? FormType.SignUp : FormType.SignIn);
}
