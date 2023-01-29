import 'package:flutter/material.dart';
import 'package:whatsapp_clone/src/_widgets/contact_image.dart';
import 'package:whatsapp_clone/src/services/routing_service.dart';
import 'package:whatsapp_clone/src/styles.dart';

class ExitChatButton extends StatelessWidget {
  const ExitChatButton({Key? key, required this.contactImg}) : super(key: key);

  final String contactImg;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: AppBorderRadius.xlAll ,
      onTap: () {
        goBack(context);
      },
      child: Padding(
        padding: AppPaddings.smAll,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
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
    );
  }
}
