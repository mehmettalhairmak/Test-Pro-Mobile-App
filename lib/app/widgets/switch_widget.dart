// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SwitchWidget extends StatelessWidget {
  final OnToggle? onToggle;
  int initialLabelIndex;

  SwitchWidget({
    Key? key,
    this.onToggle,
    this.initialLabelIndex = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ToggleSwitch(
      minWidth: 190.0,
      minHeight: 50.0,
      fontSize: 16.0,
      initialLabelIndex: initialLabelIndex,
      activeBgColor: [Colors.grey[800]!],
      activeFgColor: Colors.white,
      inactiveBgColor: Colors.grey,
      inactiveFgColor: Colors.grey[900],
      totalSwitches: 2,
      labels: const ['Sign up', 'Sign in'],
      onToggle: onToggle,
    );
  }
}
