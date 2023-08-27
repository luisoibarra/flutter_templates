import 'package:flutter/cupertino.dart';

import '../../themes/sizes.dart';

class TitleText extends StatelessWidget {
  final String text;

  const TitleText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(
          fontSize: Sizes.largeText,
          fontWeight: FontWeight.bold,
        ));
  }
}
