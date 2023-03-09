import 'package:flutter/material.dart';
import 'package:whatsapp_clone/src/services/data_service.dart';
import 'package:whatsapp_clone/src/views/calls_page/call_contact_card.dart';

class CallsPage extends StatefulWidget {
  const CallsPage({Key? key}) : super(key: key);

  @override
  State<CallsPage> createState() => _CallsPageState();
}

class _CallsPageState extends State<CallsPage> {
  List _callList = [];

  @override
  void initState() {
    super.initState();
    getCalls();
  }

  void getCalls() async {
    final data = await getCallList();
    setState(() {
      _callList = List.from(data.reversed);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (final call in _callList)
          CallContactCard(
            imageUrl: call["contactImage"],
            name: call["contactName"],
            date: call["date"],
            receptor: {"pass": call["pass"], "receptor": call["receptor"]},
          )
      ],
    );
  }
}
