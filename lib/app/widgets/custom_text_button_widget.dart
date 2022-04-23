import 'package:flutter/material.dart';

class CustomTextButtonWidget extends StatelessWidget {
  final String buttonText;
  final Color textColor;
  final VoidCallback onPressed;

  const CustomTextButtonWidget({
    required this.buttonText,
    required this.onPressed,
    Key? key,
    this.textColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        buttonText,
        style: const TextStyle(color: Colors.black),
      ),
      style: TextButton.styleFrom(primary: Theme.of(context).primaryColor),
      onPressed: onPressed,
    );
  }
}
