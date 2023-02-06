import 'package:flutter/material.dart';
import 'package:whatsapp_clone/src/services/data_service.dart';

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
      children: [

        ..._getCards()],
    );
  }

  List<Widget> _getCards() {
    List<Widget> statusCards = [];

    for (final status in _feedList) {
      final widget = Card(
        child: Text(status["stories"].toString()),
      );

      statusCards.add(widget);
    }

    return statusCards;
  }
}
