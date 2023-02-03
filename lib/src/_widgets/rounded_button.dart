import 'package:flutter/material.dart';
import 'package:whatsapp_clone/src/styles.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key, required this.onTap, required this.icon,
  }) : super(key: key);

  final Function onTap;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){
        onTap();
      },
      child: icon,
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(),
        padding: AppPaddings.mdAll,
      ),

    );
  }
}