import 'package:flutter/material.dart';
import 'package:whatsapp_clone/src/_widgets/contact_image.dart';
import 'package:whatsapp_clone/src/services/routing_service.dart';
import 'package:whatsapp_clone/src/styles.dart';

class ChatCard extends StatelessWidget {
  ChatCard(
      {Key? key,
      required this.chatId,
      required this.contact,
      required this.time,
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Color onBackground = theme.colorScheme.onBackground;

    TextStyle textColor = TextStyle(color: onBackground);

    return ListTile(
      onTap: () {
        goToRoute(context, "/chats/$chatId");
      },
      leading: ContactImage(
        size: AppSizes.mdSize,
        imageUrl: imageUrl,
        onTap: () {},
      ),
      title: Text(
        contact,
        style: textColor,
      ),
      subtitle: Row(
        children: [
          author.toUpperCase() == "YOU"
              ? const Icon(
                  AppIcons.checkIcon,
                  size: AppIcons.mdSize,
                )
              : const SizedBox(),
          Text(
            message,
            style: textColor.copyWith(color: onBackground.withOpacity(0.5)),
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
