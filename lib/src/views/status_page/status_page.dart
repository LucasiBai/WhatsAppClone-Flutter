import 'package:flutter/material.dart';
import 'package:whatsapp_clone/src/_widgets/contact_image.dart';
import 'package:whatsapp_clone/src/services/data_service.dart';
import 'package:whatsapp_clone/src/styles.dart';
import 'package:whatsapp_clone/src/views/status_page/status_card.dart';

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
    final theme = Theme.of(context);

    Color onBackground = theme.colorScheme.onBackground;

    TextStyle textColor = TextStyle(color: onBackground);

    return Container(
      color: theme.colorScheme.background,
      child: ListView(
        children: [
          Text("Recientes", style: textColor,),
          ..._getCards()["notViewed"],
          Text("Vistos", style: textColor,),
          ..._getCards()["viewed"]
        ],
      ),
    );
  }

  Map _getCards() {
    List<Widget> statusCardsViewed = [];
    List<Widget> statusCardsNotViewed = [];

    for (final status in _feedList) {
      final widget = StatusCard(
          statusData: status,
      );
      status["viewed"]? statusCardsViewed.add(widget) : statusCardsNotViewed.add(widget);
    }

    return {"notViewed": statusCardsViewed, "viewed":statusCardsNotViewed};
  }
}
