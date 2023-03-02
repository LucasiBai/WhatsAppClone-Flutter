import 'dart:math';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/src/_widgets/contact_image.dart';
import 'package:whatsapp_clone/src/services/routing_service.dart';
import 'package:whatsapp_clone/src/styles.dart';

class StatusCard extends StatelessWidget {
  const StatusCard({Key? key, this.statusData}) : super(key: key);

  final statusData;

  double colorWidth(double radius, int statusCount, double separation) {
    return ((2 * pi * radius) - (statusCount * separation)) / statusCount;
  }

  double separation(int statusCount) {
    if (statusCount <= 20)
      return 3.0;
    else if (statusCount <= 30)
      return 1.8;
    else if (statusCount <= 60)
      return 1.0;
    else
      return 0.3;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Color onBackground = theme.colorScheme.onBackground;

    TextStyle textColor = TextStyle(color: onBackground);

    double borderRadius = AppSizes.mdSize - 1;

    return ListTile(
      onTap: () {
        goToRoute(context, "/status/${statusData["id"]}");
      },
      leading: DottedBorder(
        color: !statusData["viewed"]
            ? onBackground.withOpacity(0.5)
            : theme.colorScheme.secondary,
        radius: Radius.circular(borderRadius),
        borderType: BorderType.Circle,
        dashPattern: statusData["stories"] == 1
            ? [
                (2 * pi * (borderRadius + 2)),
                0,
              ]
            : [
                colorWidth(borderRadius + 2, statusData["stories"],
                    separation(statusData["stories"])),
                separation(statusData["stories"]),
              ],
        strokeWidth: 2,
        child: ContactImage(
          hasIcon: false,
          size: borderRadius ,
          imageUrl: statusData["contactImg"],
          onTap: () {},
        ),
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
