import 'package:flutter/material.dart';
import 'package:whatsapp_clone/src/_widgets/contact_image.dart';
import 'package:whatsapp_clone/src/services/data_service.dart';
import 'package:whatsapp_clone/src/services/routing_service.dart';
import 'package:whatsapp_clone/src/styles.dart';

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

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              decoration:
                  BoxDecoration(color: colorScheme.primary, boxShadow: const [
                BoxShadow(blurRadius: AppBorderRadius.sm, color: Colors.black26)
              ]),
              padding: AppPaddings.mdVer,
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
                  )
                ],
              ),
            ),
            SizedBox(
              height: AppPaddings.md,
            ),
            Container(
              decoration:
                  BoxDecoration(color: colorScheme.primary, boxShadow: const [
                BoxShadow(blurRadius: AppBorderRadius.sm, color: Colors.black26)
              ]),
              padding: AppPaddings.mdVer,
              child: Column(
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
          ],
        ),
      ),
    );
  }
}
