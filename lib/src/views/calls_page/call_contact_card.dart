import 'package:flutter/material.dart';
import 'package:whatsapp_clone/src/_widgets/contact_image.dart';
import 'package:whatsapp_clone/src/styles.dart';

class CallContactCard extends StatelessWidget {
  const CallContactCard(
      {Key? key,
      required this.imageUrl,
      required this.name,
      required this.date,
      required this.receptor})
      : super(key: key);

  final String imageUrl;
  final String name;
  final String date;
  final Map receptor;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final textStyle = TextStyle(color: colorScheme.onBackground);

    final iconColor = receptor["pass"] ? Colors.green : Colors.red;

    return ListTile(
      onTap: () {},
      leading: ContactImage(
        onTap: () {},
        imageUrl: imageUrl,
        size: AppSizes.mdSize,
        hasIcon: false,
      ),
      title: Text(
        name,
        style: textStyle,
      ),
      subtitle: Row(
        children: [
          Icon(
            receptor["receptor"].toUpperCase() == "CONTACT"
                ? AppIcons.callEmitterIcon
                : AppIcons.callReceptorIcon,
            color: iconColor,
          ),
          Text(
            date,
            style: TextStyle(color: colorScheme.onBackground.withOpacity(0.5)),
          ),
        ],
      ),
      trailing: Icon(
        AppIcons.phoneIcon,
        color: colorScheme.secondary,
      ),
    );
  }
}
