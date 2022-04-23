import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final String buttonText;
  final Color? buttonColor;
  final Color? textColor;
  final double textFontSize;
  final double radius;
  final double height;
  final double width;
  final VoidCallback onPressed;

  const CustomButtonWidget({
    Key? key,
    this.buttonText = "",
    this.buttonColor = Colors.white,
    this.textColor = Colors.black,
    this.textFontSize = 16,
    this.radius = 16,
    this.height = 50,
    this.width = 200,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        child: Text(
          buttonText,
          style: TextStyle(
              color: textColor,
              fontSize: textFontSize,
              fontWeight: FontWeight.normal),
        ),
        style: ElevatedButton.styleFrom(
          primary: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius)),
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
