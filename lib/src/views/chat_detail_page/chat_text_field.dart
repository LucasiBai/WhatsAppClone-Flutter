import 'package:flutter/material.dart';
import 'package:whatsapp_clone/src/_widgets/rounded_button.dart';
import 'package:whatsapp_clone/src/services/data_service.dart';
import 'package:whatsapp_clone/src/styles.dart';

class ChatTextField extends StatefulWidget {
  const ChatTextField({Key? key, required this.chatId}) : super(key: key);

  final int chatId;

  @override
  State<ChatTextField> createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {
  final FocusNode _focus = FocusNode();

  final TextEditingController _textController = TextEditingController();

  bool _isChatOpen = false;

  void _onFocus() {
    setState(() {
      _isChatOpen = true;
    });
  }

  void _sendMessage()async{
    addMessageTo(widget.chatId,_textController.text);
  }

  @override
  void initState() {
    _focus.addListener(_onFocus);
    super.initState();
  }

  @override
  void dispose() {
    _focus.removeListener(_onFocus);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: TextField(
          focusNode: _focus,
          decoration: const InputDecoration(
            hintText: "Mensaje",
          ),
          controller: _textController,
        )),
        _isChatOpen
            ? RoundedButton(
                onTap: () {
                  _sendMessage();
                },
                icon: const Icon(AppIcons.sendIcon),
              )
            : RoundedButton(
                onTap: () {},
                icon: const Icon(AppIcons.micIcon),
              )
      ],
    );
  }
}
