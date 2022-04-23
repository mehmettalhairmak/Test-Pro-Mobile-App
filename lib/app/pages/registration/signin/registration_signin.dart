// ignore_for_file: prefer_if_null_operators

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_pro_mobile_app/app/pages/welcome.dart';
import 'package:test_pro_mobile_app/app/widgets/cross_platform_notification.dart';
import 'package:test_pro_mobile_app/app/widgets/custom_text_button_widget.dart';
import 'package:test_pro_mobile_app/app/widgets/custom_button_widget.dart';
import 'package:test_pro_mobile_app/app/widgets/custom_text_form_field_widget.dart';
import 'package:test_pro_mobile_app/error_exception.dart';
import 'package:test_pro_mobile_app/models/user_model.dart';
import 'package:test_pro_mobile_app/viewmodel/view_model.dart';

class SignInPanel extends StatefulWidget {
  const SignInPanel({Key? key}) : super(key: key);

  @override
  State<SignInPanel> createState() => _SignInPanelState();
}

class _SignInPanelState extends State<SignInPanel> {
  final _formKey = GlobalKey<FormState>();

  String _email = "", _password = "";

  @override
  Widget build(BuildContext context) {
    final _viewModel = Provider.of<ViewModel>(context, listen: false);

    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormFieldWidget(
            headerText: "Email",
            errorText: _viewModel.emailErrorMessage != null
                ? _viewModel.emailErrorMessage
                : null,
            onSaved: (String? value) => _email = value!,
          ),
          const SizedBox(height: 40),
          CustomTextFormFieldWidget(
            fontSize: 16,
            suffixIcon: true,
            obscureText: true,
            autoCorrect: false,
            enableSuggestions: false,
            headerText: "Password",
            onSaved: (String? value) => _password = value!,
            errorText: _viewModel.passwordErrorMessage != null
                ? _viewModel.passwordErrorMessage
                : null,
          ),
          const SizedBox(height: 10),
          CustomTextButtonWidget(
              buttonText: "Forgot Password?", onPressed: () {}),
          const SizedBox(height: 227),
          CustomButtonWidget(
            width: 300,
            height: 60,
            buttonText: "Contiune",
            textFontSize: 18,
            buttonColor: Colors.blue,
            textColor: Colors.white,
            onPressed: () => formSubmit(),
          )
        ],
      ),
    );
  }

  formSubmit() async {
    _formKey.currentState?.save();

    final _viewModel = Provider.of<ViewModel>(context, listen: false);

    bool result = _viewModel.checkEmailPassword(_email, _password);

    if (result) {
      try {
        UserModel? _currentUser =
            await _viewModel.signInWithEmailPassword(_email, _password);
        if (_currentUser != null) {
          debugPrint('Oturum Açan User ID : ${_currentUser.userID.toString()}');
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => WelcomePage(user: _currentUser),
            ),
            (route) => false,
          );
        }
      } on FirebaseAuthException catch (e) {
        debugPrint("Widget Oturum Açma Hata Yakalandı ${e.code.toString()}");

        CrossPlatformAlertDialog(
          title: "SignUp Error",
          content: Errors.showError(e.code),
          mainButtonTitle: "OK",
        ).show(context);
      }
    } else {
      setState(() {});
    }
  }
}
