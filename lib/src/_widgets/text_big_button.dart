import 'package:flutter/material.dart';
import 'package:whatsapp_clone/src/styles.dart';

class TextBigButton extends StatelessWidget {
  const TextBigButton({Key? key, required this.onTap, required this.text})
      : super(key: key);
  final Function onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorScheme.secondary
      ),
      onPressed: () {
        onTap();
      },
      child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppPaddings.l, vertical: AppPaddings.md),
          child: Text(
            text,
            style: TextStyle(color: colorScheme.onSecondary),
          )),
    );
  }
}
