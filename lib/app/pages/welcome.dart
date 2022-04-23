// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_pro_mobile_app/app/pages/home_page.dart';
import 'package:test_pro_mobile_app/app/widgets/cross_platform_notification.dart';
import 'package:test_pro_mobile_app/app/widgets/custom_horizontal_logo_widget.dart';
import 'package:test_pro_mobile_app/models/user_model.dart';
import 'package:test_pro_mobile_app/viewmodel/view_model.dart';

class WelcomePage extends StatelessWidget {
  UserModel? user;

  WelcomePage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 30, width: 30),
                const CustomHorizontalLogoWidget(),
                IconButton(
                  onPressed: () {
                    signOutAccept(context);
                  },
                  icon: const Icon(
                    Icons.exit_to_app,
                    size: 36,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 150),
            Text(
              "Welcome !!\n\n" + name(),
              style: const TextStyle(fontSize: 36),
            ),
          ],
        ),
      ),
    );
  }

  String name() {
    if (user!.name != null) {
      return user!.name!;
    } else {
      return user!.userID!;
    }
  }

  Future<bool> signOut(BuildContext context) async {
    final _userViewModel = Provider.of<ViewModel>(context, listen: false);
    bool value = await _userViewModel.signOut();
    if (value) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
        (route) => false,
      );
    }
    return value;
  }

  Future signOutAccept(BuildContext context) async {
    final result = await const CrossPlatformAlertDialog(
      title: "Are you sure?",
      content: "Are you sure want to exit?",
      mainButtonTitle: "Sign Out",
      cancelButtonTitle: "Give Up",
    ).show(context);

    if (result == true) {
      signOut(context);
    }
  }
}
