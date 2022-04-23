// ignore_for_file: unused_field, prefer_if_null_operators, must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_pro_mobile_app/app/pages/registration/signup/registration_signup_name.dart';
import 'package:test_pro_mobile_app/app/widgets/cross_platform_notification.dart';

import 'package:test_pro_mobile_app/app/widgets/privacy_police_text_widget.dart';
import 'package:test_pro_mobile_app/app/widgets/custom_button_widget.dart';
import 'package:test_pro_mobile_app/app/widgets/custom_text_form_field_widget.dart';
import 'package:test_pro_mobile_app/models/user_model_singleton.dart';
import 'package:test_pro_mobile_app/viewmodel/view_model.dart';

class SignUpPanel extends StatefulWidget {
  const SignUpPanel({Key? key}) : super(key: key);

  @override
  State<SignUpPanel> createState() => _SignUpPanelState();
}

class _SignUpPanelState extends State<SignUpPanel> {
  String _email = "", _password1 = "", _password2 = "";
  String? passwordErrorMessage;
  String? emailErrorMessage;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController password1Controller = TextEditingController();
  final TextEditingController password2Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final _userViewModel = Provider.of<ViewModel>(context);

    return Center(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFormFieldWidget(
              controller: emailController,
              headerText: "Email",
              onSaved: (String? value) => _email = value!,
              errorText: _userViewModel.emailErrorMessage != null
                  ? _userViewModel.emailErrorMessage
                  : null,
            ),
            const SizedBox(height: 40),
            CustomTextFormFieldWidget(
              fontSize: 16,
              controller: password1Controller,
              suffixIcon: true,
              obscureText: true,
              autoCorrect: false,
              onSaved: (String? value) => _password1 = value!,
              enableSuggestions: false,
              errorText: _userViewModel.passwordErrorMessage != null
                  ? _userViewModel.passwordErrorMessage
                  : null,
              headerText: "Create Password",
            ),
            const SizedBox(height: 40),
            CustomTextFormFieldWidget(
              fontSize: 16,
              controller: password2Controller,
              suffixIcon: true,
              obscureText: true,
              autoCorrect: false,
              onSaved: (String? value) => _password2 = value!,
              enableSuggestions: false,
              errorText: _userViewModel.passwordErrorMessage != null
                  ? _userViewModel.passwordErrorMessage
                  : null,
              headerText: "Re-write Password",
            ),
            const SizedBox(height: 50),
            const PrivacyPoliceTextWidget(),
            const SizedBox(height: 30),
            CustomButtonWidget(
                width: 300,
                height: 60,
                buttonText: "Contiune",
                textFontSize: 18,
                buttonColor: Colors.blue,
                textColor: Colors.white,
                onPressed: () => formSubmit()),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  formSubmit() async {
    _formKey.currentState?.save();
    if (_password1 == _password2) {
      UserModelSingleton.setEmail(_email);
      UserModelSingleton.setPassword(_password1);

      final _viewModel = Provider.of<ViewModel>(context, listen: false);

      bool result = _viewModel.checkEmailPassword(_email, _password1);

      if (result) {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const SignUpNamePage(),
        ));
      } else {
        setState(() {});
      }
    } else {
      debugPrint("The information you have entered does not match each other");
      const CrossPlatformAlertDialog(
        title: "Error",
        content: "The information you have entered does not match each other",
        mainButtonTitle: "OK",
      ).show(context);
    }
  }
}
