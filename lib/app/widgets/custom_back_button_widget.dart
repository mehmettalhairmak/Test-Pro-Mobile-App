import 'package:flutter/material.dart';

class CustomBackButtonWidget extends StatelessWidget {
  const CustomBackButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: const Icon(
        Icons.arrow_circle_left,
        size: 36,
        color: Colors.black,
      ),
    );
  }
}
