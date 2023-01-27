import 'package:flutter/material.dart';
import 'package:whatsapp_clone/src/_widgets/contact_image.dart';
import 'package:whatsapp_clone/src/services/routing_service.dart';
import 'package:whatsapp_clone/src/styles.dart';

class ExitChatButton extends StatelessWidget {
  const ExitChatButton({Key? key, required this.contactImg}) : super(key: key);

  final String contactImg;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppPaddings.smLeft,
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(40)),
        onTap: () {
          goBack(context);
        },
        child: Container(
          constraints: const BoxConstraints(maxHeight: 1),
          child: Row(
            children: [
              const Icon(
                AppIcons.backIcon,
                color: Colors.white,
                size: AppIcons.lSize,
              ),
              ContactImage(
                onTap: () {},
                imageUrl: contactImg,
                size: AppSizes.smSize,
              )
            ],
          ),
        ),
      ),
    );
  }
}
