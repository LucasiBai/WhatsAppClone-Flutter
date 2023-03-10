import 'package:flutter/material.dart';

class TextBigButton extends StatelessWidget {
  const TextBigButton({Key? key, required this.onTap, required this.child}) : super(key: key);
  final Function onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: (){onTap();}, child: child);
  }
}
