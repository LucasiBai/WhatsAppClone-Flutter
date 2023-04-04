import 'package:custom_clippers/custom_clippers.dart';
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

    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: AppPaddings.sm, vertical: AppPaddings.sm),
      constraints: const BoxConstraints(maxWidth: AppContraints.lSize),
      child: ClipPath(
        clipper: UpperNipMessageClipperTwo(
            ownMessage ? MessageType.send : MessageType.receive,
            nipHeight: AppPaddings.md,
            nipWidth: AppPaddings.md),
        child: Container(
          color: !ownMessage && isDarkMode
              ? Theme.of(context).colorScheme.primary
              : ownMessage && isDarkMode
                  ? Theme.of(context).colorScheme.secondary
                  : !ownMessage
                      ? Theme.of(context).colorScheme.background
                      : Colors.green[100],
          padding: const EdgeInsets.symmetric(
              vertical: AppPaddings.md, horizontal: AppPaddings.l),
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
