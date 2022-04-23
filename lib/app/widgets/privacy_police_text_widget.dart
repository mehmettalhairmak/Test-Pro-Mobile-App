import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class PrivacyPoliceTextWidget extends StatelessWidget {
  const PrivacyPoliceTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle defaultStyle =
        const TextStyle(color: Colors.grey, fontSize: 16.0);
    TextStyle linkStyle = const TextStyle(color: Colors.blue);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: defaultStyle,
          children: <TextSpan>[
            const TextSpan(
              text:
                  'Curabitur loborits id lorem id bibendum. Ut id consectetur magna ',
            ),
            TextSpan(
              text: 'Terms of Service',
              style: linkStyle,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  debugPrint('Terms of Service"');
                },
            ),
            const TextSpan(text: ' augue enim, pulvinar '),
            TextSpan(
              text: 'Privacy Policy',
              style: linkStyle,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  debugPrint('Privacy Notice"');
                },
            ),
            const TextSpan(text: ' lacinia at '),
          ],
        ),
      ),
    );
  }
}
