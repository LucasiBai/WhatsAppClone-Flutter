import 'package:flutter/material.dart';
import 'package:whatsapp_clone/src/_widgets/contact_image.dart';
import 'package:whatsapp_clone/src/styles.dart';

class StatusCard extends StatelessWidget {
  const StatusCard({Key? key, this.statusData}) : super(key: key);

  final statusData;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Color onBackground = theme.colorScheme.onBackground;

    TextStyle textColor = TextStyle(color: onBackground);

    return ListTile(
      onTap: () {},
      leading: ContactImage(
        size: AppSizes.mdSize,
        imageUrl: statusData["contactImg"],
        onTap: () {},
      ),
      title: Text(
        statusData["contactName"],
        style: textColor,
      ),
      subtitle: Text(
        statusData["lastModification"],
        style: textColor.copyWith(color: onBackground.withOpacity(0.5)),
      ),
    );
  }
}
