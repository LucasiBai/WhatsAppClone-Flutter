import 'package:flutter/material.dart';
import 'package:whatsapp_clone/src/_widgets/contact_image.dart';
import 'package:whatsapp_clone/src/services/data_service.dart';
import 'package:whatsapp_clone/src/styles.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  List _feedList = [];

  @override
  void initState() {
    getFeed();
    super.initState();
  }

  getFeed() async {
    final data = await getStatusList();
    setState(() {
      _feedList = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [Text("Recientes"), ..._getCards()],
    );
  }

  List<Widget> _getCards() {
    List<Widget> statusCards = [];

    for (final status in _feedList) {
      final widget = ListTile(
        leading: ContactImage(
          size: AppSizes.mdSize,
          imageUrl: status["contactImg"],
          onTap: () {},
        ),
      );

      statusCards.add(widget);
    }

    return statusCards;
  }
}
