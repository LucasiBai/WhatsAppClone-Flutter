import 'package:flutter/material.dart';
import 'package:whatsapp_clone/src/_widgets/custom_icon_button.dart';

class LabelButton extends StatelessWidget {
  const LabelButton({Key? key, required this.onTap, required this.label, required this.icon}) : super(key: key);

  final Function onTap;
  final Text label;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomIconButton(icon: icon, onTap: onTap),
        label
      ],
    );
  }
}
