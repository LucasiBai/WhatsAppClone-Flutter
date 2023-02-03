import 'package:flutter/material.dart';
import 'package:whatsapp_clone/src/_widgets/rounded_button.dart';
import 'package:whatsapp_clone/src/styles.dart';

class ChatTextField extends StatefulWidget {
  const ChatTextField({Key? key}) : super(key: key);

  @override
  State<ChatTextField> createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: TextField(
          decoration: InputDecoration(
              hintText: "Mensaje",
          ),
        )),
        RoundedButton(
          onTap: (){},
          icon: const Icon(AppIcons.micIcon),
        )
      ],
    );
  }
}


