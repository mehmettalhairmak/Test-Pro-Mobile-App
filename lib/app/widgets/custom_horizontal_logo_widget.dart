import 'package:flutter/material.dart';

class CustomHorizontalLogoWidget extends StatelessWidget {
  const CustomHorizontalLogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      height: 30,
      child: Image.asset("assets/images/logo_horizontal.png"),
    );
  }
}
