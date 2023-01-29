import 'package:flutter/material.dart';
import 'package:whatsapp_clone/src/styles.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    Key? key,
    required this.ownMessage,
    required this.message,
  }) : super(key: key);

  final bool ownMessage;
  final message;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppPaddings.smAll,
      padding: AppPaddings.mdAll,
      constraints: const BoxConstraints(maxWidth: AppContraints.lSize),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: !ownMessage
                ? const Radius.circular(0)
                : const Radius.circular(AppBorderRadius.md),
            topRight: ownMessage
                ? const Radius.circular(0)
                : const Radius.circular(AppBorderRadius.md),
            bottomRight: const Radius.circular(AppBorderRadius.md),
            bottomLeft: const Radius.circular(AppBorderRadius.md)),
        color: Colors.blue,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              "${message["content"]}"),
          Align(
            alignment: Alignment.centerRight,
            child:
            Text(
                message["time"]
            ),
          )
        ],
      ),
    );
  }
}