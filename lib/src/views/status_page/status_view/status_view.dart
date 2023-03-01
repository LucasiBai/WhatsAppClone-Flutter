import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

import 'package:whatsapp_clone/src/services/data_service.dart';
import 'package:whatsapp_clone/src/styles.dart';
import 'package:whatsapp_clone/src/views/status_page/status_view/status_view_card.dart';

class StatusView extends StatefulWidget {
  const StatusView({Key? key, this.userId}) : super(key: key);
  final userId;

  @override
  State<StatusView> createState() => _StatusViewState();
}

class _StatusViewState extends State<StatusView> {
  final StoryController controller = StoryController();

  List<StoryItem> _contactStories = [];
  Map _contactData = {};

  void getData() async {
    final data = await getStatusData(int.parse(widget.userId));
    setState(() {
      _contactData = {"image": data["contactImg"], "name": data["contactName"]};
      for (final story in data["stories"]) {
        _contactStories.add(_getStoryItem(story));
      }
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
          child: StatusViewCard(
        stories: _contactStories,
        controller: controller,
        contactData: _contactData,
      )),
    );
  }

  StoryItem _getStoryItem(data) {
    if (data["type"] == "photo") {
      return StoryItem.pageImage(
          url: data["media"], controller: controller, caption: data["text"]);
    } else {
      return StoryItem.text(
          title: data["text"],
          backgroundColor: AppColors.colors[data["color"]]);
    }
  }
}
