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
      ),
      child: Card(
        color: !ownMessage
            ? Theme.of(context).colorScheme.onPrimary
            : Theme.of(context).colorScheme.secondary,
        child: Padding(
          padding: AppPaddings.mdAll,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("${message["content"]}"),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    message["time"],
                    style: const TextStyle(fontSize: AppTexts.smSize),
                  ),
                  if(ownMessage)const Icon(AppIcons.checkIcon, size: AppIcons.mdSize,)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
