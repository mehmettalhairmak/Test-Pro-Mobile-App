// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomTextFormFieldWidget extends StatefulWidget {
  String headerText;
  double? fontSize;
  bool obscureText;
  bool autoCorrect;
  String? errorText;
  bool enableSuggestions;
  bool suffixIcon;
  FormFieldSetter<String>? onSaved;
  TextEditingController? controller;

  CustomTextFormFieldWidget({
    Key? key,
    this.onSaved,
    this.controller,
    this.errorText,
    this.fontSize = 24,
    this.autoCorrect = false,
    this.obscureText = false,
    this.suffixIcon = false,
    this.enableSuggestions = true,
    required this.headerText,
  }) : super(key: key);

  @override
  State<CustomTextFormFieldWidget> createState() =>
      _CustomTextFormFieldWidgetState();
}

class _CustomTextFormFieldWidgetState extends State<CustomTextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.headerText, style: TextStyle(fontSize: widget.fontSize)),
          const SizedBox(height: 10),
          TextFormField(
            controller: widget.controller,
            autocorrect: widget.autoCorrect,
            obscureText: widget.obscureText,
            enableSuggestions: widget.enableSuggestions,
            keyboardType: TextInputType.emailAddress,
            onSaved: widget.onSaved,
            decoration: InputDecoration(
              errorText: widget.errorText,
              suffixIcon: widget.suffixIcon
                  ? IconButton(
                      onPressed: () {
                        widget.obscureText = !widget.obscureText;
                        setState(() {});
                      },
                      icon: const Icon(Icons.remove_red_eye),
                    )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
