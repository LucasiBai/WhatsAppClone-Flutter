import 'package:flutter/material.dart';
import 'package:whatsapp_clone/src/_widgets/section_label.dart';
import 'package:whatsapp_clone/src/services/data_service.dart';
import 'package:whatsapp_clone/src/styles.dart';
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
        const Padding(
          padding: EdgeInsets.only(top: AppPaddings.sm),
          child: SectionLabel(text: "Recientes"),
        ),
        ..._getContactCards(context, _callList)
      ],
    );
  }

  List<CallContactCard> _getContactCards(BuildContext context, dataList){
    List<CallContactCard> cardList = [];

    for (final call in dataList) {
      final CallContactCard card = CallContactCard(
        imageUrl: call["contactImage"],
        name: call["contactName"],
        date: call["date"],
        receptor: {"pass": call["pass"], "receptor": call["receptor"]},
      );

      cardList.add(card);
    }

    return cardList;
  }
}
