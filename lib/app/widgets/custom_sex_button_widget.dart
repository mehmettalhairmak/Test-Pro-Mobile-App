// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomSexButtonWidget extends StatefulWidget {
  IconData icon;
  Color iconColor;
  final String buttonText;
  final int value;
  final int groupValue;
  final ValueChanged onChanged;
  CustomSexButtonWidget({
    Key? key,
    required this.icon,
    required this.buttonText,
    required this.iconColor,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<CustomSexButtonWidget> createState() => _CustomSexButtonWidgetState();
}

class _CustomSexButtonWidgetState extends State<CustomSexButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final isSelected = widget.value == widget.groupValue;
    return GestureDetector(
      onTap: () => widget.onChanged(widget.value),
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: Column(
          children: [
            Container(
              child: Icon(
                widget.icon,
                size: 150,
                color: isSelected ? widget.iconColor : Colors.grey[600],
              ),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[400]!,
                    offset: const Offset(4, 4),
                    blurRadius: 8,
                    spreadRadius: 1,
                  ),
                  BoxShadow(
                    color: Colors.grey[400]!,
                    offset: const Offset(-4, -4),
                    blurRadius: 8,
                    spreadRadius: 1,
                  )
                ],
              ),
            ),
            const SizedBox(height: 25),
            Text(
              widget.buttonText,
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            )
          ],
        ),
      ),
    );
  }
}
