// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';

class CustomSelectorWidget extends StatelessWidget {
  int range;
  String text;
  CustomSelectorWidget({Key? key, this.text = "", required this.range})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List items = [];

    for (var i = 0; i < range; i++) {
      items.add(i.toString());
    }
    return SizedBox(
      height: 300,
      child: CupertinoPicker(
        itemExtent: 64,
        onSelectedItemChanged: (int value) {},
        children: items.map(
          (item) {
            return Center(
              child: Text(item + "\t$text"),
            );
          },
        ).toList(),
      ),
    );
  }
}
