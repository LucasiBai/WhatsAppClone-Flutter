import 'package:flutter/material.dart';
import 'package:whatsapp_clone/src/services/routing_service.dart';
import 'package:whatsapp_clone/src/styles.dart';

class ContactDialog extends StatelessWidget {
  const ContactDialog({Key? key, this.userId, this.userImg, this.contactName})
      : super(key: key);

  final userId;
  final userImg;
  final contactName;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AlertDialog(
        backgroundColor: Colors.white.withOpacity(0),
        content: Container(
          color: colorScheme.background,
          child: GestureDetector(
            onTap: () {
              goToRoute(context, "/contactImage/$userId");
            },
            child:
            Column(mainAxisSize: MainAxisSize.min, children: [
              Stack(children: [
                Hero(
                    tag: "contact-$userId",
                    child: SizedBox(
                      width: 270,
                      height: 270,
                      child: Image.network(
                        userImg,
                        fit: BoxFit.cover,
                      ),
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
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          AppIcons.chatIcon,
                          color: colorScheme.secondary,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          AppIcons.phoneIcon,
                          color: colorScheme.secondary,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          AppIcons.faceTimeIcon,
                          color: colorScheme.secondary,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          AppIcons.infoIcon,
                          color: colorScheme.secondary,
                        )),
                  ],
                ),

            ]),
          ),
        ));
  }
}
