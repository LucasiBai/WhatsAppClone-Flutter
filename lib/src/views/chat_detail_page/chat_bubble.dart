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
    final theme = Theme.of(context);

    Color onBackground = theme.colorScheme.onBackground;

    TextStyle textColor = TextStyle(color: onBackground);

    return Container(
      margin: AppPaddings.smAll,
      constraints: const BoxConstraints(maxWidth: AppContraints.lSize),
      child: Card(
        color: !ownMessage
            ? Theme.of(context).colorScheme.background
            : Theme.of(context).colorScheme.secondary,
        child: Padding(
          padding: AppPaddings.mdAll,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "${message["content"]}",
                style: textColor,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    message["time"],
                    style: textColor.copyWith(
                        fontSize: AppTexts.smSize,
                        color: onBackground.withOpacity(0.5)),
                  ),
                  if (ownMessage)
                    Icon(AppIcons.checkIcon,
                        size: AppIcons.mdSize,
                        color: onBackground.withOpacity(0.5))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
