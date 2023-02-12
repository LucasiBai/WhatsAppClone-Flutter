import 'package:flutter/material.dart';
import 'package:whatsapp_clone/src/_widgets/contact_image.dart';
import 'package:whatsapp_clone/src/styles.dart';

class MyStatusCard extends StatelessWidget {
  const MyStatusCard({Key? key, required this.onTap}) : super(key: key);

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Color onBackground = theme.colorScheme.onBackground;

    TextStyle textColor = TextStyle(color: onBackground);

    return ListTile(
      onTap: () {
        onTap();
      },
      leading: Stack(children: [
        ContactImage(
          size: AppSizes.mdSize,
          imageUrl:
              "https://www.rockandpop.cl/wp-content/uploads/2022/05/tom-holland-serie-1.jpg",
          onTap: () {},
        ),
        Positioned(
          left: 32,
          top: 30,
          child: _addButton(theme),
        )
      ]),
      title: Text(
        "Mi estado",
        style: textColor,
      ),
      subtitle: Text(
        "Añade una actualización",
        style: textColor.copyWith(color: onBackground.withOpacity(0.5)),
      ),
    );
  }

  Widget _addButton(theme) {
    return Container(
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
          AppIcons.plusIcon,
          color: theme.colorScheme.onSecondary,
          size: AppIcons.mdSize,
        ),
      ),
    );
  }
}
