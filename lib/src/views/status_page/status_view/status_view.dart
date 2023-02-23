import 'package:flutter/material.dart';
import 'package:whatsapp_clone/src/_widgets/contact_image.dart';
import 'package:whatsapp_clone/src/services/data_service.dart';
import 'package:whatsapp_clone/src/services/routing_service.dart';
import 'package:whatsapp_clone/src/styles.dart';
import 'package:whatsapp_clone/src/views/status_page/status_view/status_view_card.dart';

class StatusView extends StatefulWidget {
  const StatusView({Key? key, this.userId}) : super(key: key);
  final userId;

  @override
  State<StatusView> createState() => _StatusViewState();
}

class _StatusViewState extends State<StatusView> {
  List _urls = [];

  int _currentIdx = 0;
  Map _contactData = {};

  void getData() async {
    final data = await getStatusData(int.parse(widget.userId));
    setState(() {
      _urls = data["stories"];
      _contactData = {"image": data["contactImg"], "name": data["contactName"]};
    });
  }

  void nextStatus() {
    final lastIdx = _urls.length - 1;

    setState(() {
      _currentIdx = _currentIdx < lastIdx ? _currentIdx + 1 : 0;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            GestureDetector(
              onTap: () {
                nextStatus();
              },
              child: StatusViewCard(url: _urls[_currentIdx]),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {
                            goBack(context);
                          },
                          icon: const Icon(
                            AppIcons.backIcon,
                            color: Colors.white,
                          )),
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: AppBorderRadius.xlAll,
                              color: Colors.white),
                          padding: const EdgeInsets.all(1),
                          margin: const EdgeInsets.fromLTRB(
                              0, 0, AppPaddings.md, 0),
                          child: ContactImage(
                              onTap: () {},
                              size: AppSizes.smSize,
                              imageUrl: _contactData["image"])),
                      Text(
                        _contactData["name"],
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        AppIcons.optionsIcon,
                        color: Colors.white,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
