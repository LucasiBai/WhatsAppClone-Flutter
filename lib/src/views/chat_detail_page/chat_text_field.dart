import 'package:flutter/material.dart';
import 'package:whatsapp_clone/src/_widgets/rounded_button.dart';
import 'package:whatsapp_clone/src/services/data_service.dart';
import 'package:whatsapp_clone/src/styles.dart';
import 'package:whatsapp_clone/src/views/chat_detail_page/bubble_text_field.dart';

class ChatTextField extends StatefulWidget {
  const ChatTextField({Key? key, required this.chatId, required this.onSend})
      : super(key: key);

  final int chatId;
  final Function(int, String) onSend;

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

  void _onSend() {
    widget.onSend(widget.chatId, _textController.text);
    _textController.clear();
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
    return Container(
      margin: AppPaddings.smAll,
      child: Row(
        children: [
          Expanded(child: BubbleTextField(focus: _focus, textController: _textController)),
          RoundedButton(
            onTap: _onSend,
            icon: _isChatOpen
                ? const Icon(AppIcons.sendIcon)
                : const Icon(AppIcons.micIcon),
          )
        ],
      ),
    );
  }
}
