import 'package:flutter/material.dart';
import 'package:whatsapp_clone/src/_widgets/contact_image.dart';
import 'package:whatsapp_clone/src/styles.dart';

class ChatCard extends StatelessWidget {
  ChatCard(
      {Key? key,
      required this.chatId,
      required this.contact,
      required this.time,
      required this.onLongPress,
      required this.onTap,
      required this.selected,
      required this.imageUrl,
      required this.author,
      required this.message})
      : super(key: key);

  final int chatId;
  final String contact;
  String author;
  String message;
  final String time;
  final String imageUrl;
  Function onLongPress;
  Function onTap;
  final selected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Color onBackground = theme.colorScheme.onBackground;

    TextStyle textColor = TextStyle(color: onBackground);

    return ListTile(
      onLongPress: () {
        onLongPress();
      },
      selected: selected,
      selectedTileColor: onBackground.withOpacity(0.05),
      onTap: () {
        onTap();
      },
      leading: ContactImage(
        hasIcon: selected,
        size: AppSizes.mdSize,
        imageUrl: imageUrl,
        onTap: () {},
        icon: AppIcons.checkIcon,
      ),
      title: Text(
        contact,
        style: textColor,
      ),
      subtitle: Row(
        children: [
          author.toUpperCase() == "YOU"
              ? Icon(
                  AppIcons.checkIcon,
                  size: AppIcons.mdSize,
                  color: onBackground.withOpacity(0.5),
                )
              : const SizedBox(),
          Container(
            constraints: const BoxConstraints(maxWidth: 220),
            child: RichText(
              overflow: TextOverflow.ellipsis,
              text: TextSpan(
                text: message,
                style: textColor.copyWith(color: onBackground.withOpacity(0.5)),
              ),
            ),
          ),
        ],
      ),
      trailing: Padding(
        padding: AppPaddings.mdVer,
        child: Column(
          children: [
            Text(
              time,
              style: textColor,
            ),
          ],
        ),
      ),
    );
  }
}
