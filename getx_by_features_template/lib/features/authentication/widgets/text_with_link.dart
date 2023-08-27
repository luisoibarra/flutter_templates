import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextWithLink extends StatelessWidget {
  const TextWithLink({
    super.key,
    required this.text,
    required this.link,
    required this.onLink,
  });

  final String text;
  final String link;
  final VoidCallback onLink;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: text,
          style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
          children: [
            const TextSpan(text: " "),
            TextSpan(
              text: link,
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
              recognizer: TapGestureRecognizer()..onTap = onLink,
            ),
          ]),
    );
  }
}
