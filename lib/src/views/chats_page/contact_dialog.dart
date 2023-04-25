import 'package:flutter/material.dart';
import 'package:whatsapp_clone/src/_widgets/custom_icon_button.dart';
import 'package:whatsapp_clone/src/services/routing_service.dart';
import 'package:whatsapp_clone/src/styles.dart';

import 'package:cached_network_image/cached_network_image.dart';

class ContactDialog extends StatelessWidget {
  const ContactDialog({Key? key, this.userId, this.userImg, this.contactName})
      : super(key: key);

  final userId;
  final userImg;
  final contactName;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    const alertPadding = EdgeInsets.all(0);

    return AlertDialog(
        backgroundColor: colorScheme.background,
        contentPadding: alertPadding,
        content: Container(
          child: GestureDetector(
            onTap: () {
              goToRoute(context, "/contactImage/$userId");
            },
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Stack(children: [
                Hero(
                    tag: "contact-$userId",
                    child: SizedBox(
                      width: 290,
                      height: 290,
                      child:
                      CachedNetworkImage(
                        imageUrl: userImg,
                        placeholder: (context, url) => CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        fit: BoxFit.cover,
                      )
                    )),
                Container(
                  color: Colors.black26,
                  padding: const EdgeInsets.symmetric(
                      vertical: AppPaddings.sm, horizontal: AppPaddings.md),
                  child: Row(
                    children: [
                      Text(
                        contactName,
                        style: const TextStyle(
                            color: Colors.white, fontSize: AppTexts.xlSize),
                      )
                    ],
                  ),
                )
              ]),
              Padding(
                padding: AppPaddings.smAll,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomIconButton(
                        onTap: () {
                          goToRoute(context, "/chats/${userId}");
                        },
                        icon: Icon(
                          AppIcons.chatIcon,
                          color: colorScheme.secondary,
                        )),
                    CustomIconButton(
                        onTap: () {},
                        icon: Icon(
                          AppIcons.phoneIcon,
                          color: colorScheme.secondary,
                        )),
                    CustomIconButton(
                        onTap: () {},
                        icon: Icon(
                          AppIcons.faceTimeIcon,
                          color: colorScheme.secondary,
                        )),
                    CustomIconButton(
                        onTap: () {
                          goToRoute(context, "/contactDetail/${userId}");
                        },
                        icon: Icon(
                          AppIcons.infoIcon,
                          color: colorScheme.secondary,
                        )),
                  ],
                ),
              ),
            ]),
          ),
        ));
  }
}
