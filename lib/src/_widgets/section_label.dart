import 'package:flutter/material.dart';
import 'package:whatsapp_clone/src/styles.dart';

class SectionLabel extends StatelessWidget {
  const SectionLabel({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Color onBackground = theme.colorScheme.onBackground;

    TextStyle textColor = TextStyle(
        color: onBackground.withOpacity(0.5),
        fontWeight: AppTexts.mdWeight,
        fontSize: AppTexts.mdSize);

    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: AppPaddings.sm, horizontal: AppPaddings.l),
      child: Text(
        text,
        style: textColor,
      ),
    );
  }
}
