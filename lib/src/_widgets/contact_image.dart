import 'package:flutter/material.dart';
import 'package:whatsapp_clone/src/styles.dart';

class ContactImage extends StatelessWidget {
  const ContactImage(
      {Key? key,
      required this.onTap,
      required this.size,
      required this.imageUrl,
      this.icon,
        required this.hasIcon
      })
      : super(key: key);

  final Function onTap;
  final double size;
  final String imageUrl;
  final icon;
  final bool hasIcon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(children: [
      CircleAvatar(
        backgroundImage: const AssetImage("assets/images/contact_image.webp"),
        foregroundImage: NetworkImage(imageUrl),
        radius: size,
      ),
      if(hasIcon)
      Positioned(
        left: 32,
        top: 30,
        child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  borderRadius: AppBorderRadius.mdAll,
                  color: theme.colorScheme.background,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: AppBorderRadius.mdAll,
                    color: theme.colorScheme.secondary,
                  ),
                  child: Icon(
                    icon,
                    color: theme.colorScheme.onSecondary,
                    size: AppIcons.mdSize,
                  ),
                ),
              )
        ,
      )
    ]);
  }
}
