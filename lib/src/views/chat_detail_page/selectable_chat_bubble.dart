import 'package:flutter/material.dart';
import 'package:whatsapp_clone/src/views/chat_detail_page/chat_bubble.dart';

class SelectableChatBubble extends StatelessWidget {
  const SelectableChatBubble(
      {Key? key,
      required this.selected,
      required this.ownMessage,
      required this.message,
      required this.onTap,
      required this.onLongPress})
      : super(key: key);

  final bool selected;
  final bool ownMessage;
  final Map message;

  final Function(Map message) onTap;
  final Function(Map message) onLongPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onLongPress: () {
          onLongPress(message);
        },
        onTap: () {
          onTap(message);
        },
        child: Container(
          width: double.infinity,
          color: selected
              ? Theme.of(context).colorScheme.tertiary.withOpacity(0.3)
              : Colors.white.withOpacity(0),
          child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment:
                  ownMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
              children: [
                ChatBubble(ownMessage: ownMessage, message: message),
              ]),
        ));
  }
}
