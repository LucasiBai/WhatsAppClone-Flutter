import 'package:flutter/material.dart';
import 'package:whatsapp_clone/src/_widgets/contact_image.dart';
import 'package:whatsapp_clone/src/_widgets/label_button.dart';

import 'package:whatsapp_clone/src/services/data_service.dart';
import 'package:whatsapp_clone/src/services/routing_service.dart';
import 'package:whatsapp_clone/src/styles.dart';
import 'package:whatsapp_clone/src/views/chat_detail_page/contact_detail/section_card.dart';

class ContactDetailView extends StatefulWidget {
  const ContactDetailView({Key? key, required this.userId}) : super(key: key);

  final userId;

  @override
  State<ContactDetailView> createState() => _ContactDetailViewState();
}

class _ContactDetailViewState extends State<ContactDetailView> {
  Map _contactData = {};

  void _getContactData() async {
    final data = await getDetailData(int.parse(widget.userId));

    setState(() {
      _contactData = data;
    });
  }

  @override
  void initState() {
    super.initState();
    _getContactData();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    final TextStyle textStyle = TextStyle(color: colorScheme.onBackground);

    final TextStyle iconStyle =
        TextStyle(color: colorScheme.secondary, fontWeight: AppTexts.mdWeight);

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: SafeArea(
        child: ListView(
          children: [
            SectionCard(
              child: Column(
                children: [
                  ContactImage(
                      onTap: () {
                        goToRoute(context, "/contactImage/${widget.userId}");
                      },
                      size: AppSizes.xlSize,
                      imageUrl: _contactData["imageUrl"],
                      hasIcon: false),
                  Text(
                    "${_contactData["contact"]}",
                    style: textStyle,
                  ),
                  Text(
                    "${_contactData["phoneNumber"]}",
                    style: textStyle.copyWith(
                        color: colorScheme.onBackground.withOpacity(0.6)),
                  ),
                  Text(
                    "En línea",
                    style: textStyle.copyWith(
                        color: colorScheme.onBackground.withOpacity(0.6)),
                  ),
                  Container(
                    constraints:const BoxConstraints(maxWidth: 200),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LabelButton(
                            icon: Icon(
                              AppIcons.phoneIcon,
                              color: colorScheme.secondary,
                            ),
                            label: Text(
                              "Llamar",
                              style: iconStyle,
                            ),
                            onTap: () {}),
                        LabelButton(
                            icon: Icon(AppIcons.faceTimeIcon,
                                color: colorScheme.secondary),
                            label: Text(
                              "Video",
                              style: iconStyle,
                            ),
                            onTap: () {}),
                        LabelButton(
                            icon: Icon(AppIcons.searchIcon,
                                color: colorScheme.secondary),
                            label: Text(
                              "Buscar",
                              style: iconStyle,
                            ),
                            onTap: () {}),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: AppPaddings.md,
            ),
           SectionCard(
             child: Padding(
               padding: AppPaddings.lHor,
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(
                     "${_contactData["info"]}",
                     style: textStyle,
                   ),
                   Text(
                     "11 de julio 2021",
                     style: textStyle.copyWith(
                         color: colorScheme.onBackground.withOpacity(0.6)),
                   )
                 ],
               ),
             ),
           )
          ],
        ),
      ),
    );
  }
}
