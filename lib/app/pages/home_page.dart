import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_pro_mobile_app/app/pages/registration/registration_base.dart';
import 'package:test_pro_mobile_app/app/pages/welcome.dart';
import 'package:test_pro_mobile_app/app/widgets/custom_text_button_widget.dart';
import 'package:test_pro_mobile_app/app/widgets/custom_button_widget.dart';
import 'package:test_pro_mobile_app/models/user_model.dart';
import 'package:test_pro_mobile_app/viewmodel/view_model.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 150),
            Image.asset(
              "assets/images/logo.png",
              width: 300,
              height: 300,
            ),
            //const SizedBox(height: 20),
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[600],
                    borderRadius: BorderRadius.circular(16)),
                height: 170,
                width: 300,
                child: const SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Test Pro is a 9-week, part-time online QA Engineer bootcamp. Test Pro utilizes an Agile Scrum teaching methodology. QA Engineer bootcamp students will learn development lifecycle, test documentation, test classification, and architecture of web and mobile apps.",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            CustomButtonWidget(
              height: 50,
              width: 250,
              buttonText: "Contiune With E-Mail",
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const RegisterBase()));
              },
            ),
            const SizedBox(height: 50),
            CustomTextButtonWidget(
              buttonText: "Login without signing up",
              onPressed: () {
                anonymousLogin(context);
              },
            )
          ],
        ),
      ),
    );
  }

  void anonymousLogin(BuildContext context) async {
    final _userViewModel = Provider.of<ViewModel>(context, listen: false);
    UserModel? _user = await _userViewModel.signInAnonymously();
    debugPrint('Oturum Açan User ID : ${_user?.userID.toString()}');
    Navigator.pushAndRemoveUntil(
      _scaffoldKey.currentContext!,
      MaterialPageRoute(
        builder: (context) => WelcomePage(user: _user),
      ),
      (route) => false,
    );
  }
}
