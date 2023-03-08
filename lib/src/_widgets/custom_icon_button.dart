import 'package:flutter/material.dart';
import 'package:whatsapp_clone/src/styles.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton({Key? key, required this.icon,required this.onTap}) : super(key: key);

  Function onTap;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        borderRadius: AppBorderRadius.xlAll,
        onTap: (){onTap();},
        child:Padding(
          padding: AppPaddings.smAll,
          child: icon
        ));
  }
}
