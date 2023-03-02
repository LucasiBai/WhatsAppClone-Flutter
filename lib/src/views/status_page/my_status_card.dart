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
      leading:ContactImage(
        hasIcon: true,
        size: AppSizes.mdSize,
        imageUrl: "https://cdn.cnn.com/cnnnext/dam/assets/211214174110-tom-holland-super-169.jpg",
        onTap: (){},
        icon: AppIcons.plusIcon,

      ),
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


}
