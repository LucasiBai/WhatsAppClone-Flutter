import 'package:flutter/material.dart';

import 'package:whatsapp_clone/services/data_service.dart';
import 'package:whatsapp_clone/services/routing_service.dart';

class ChatDetail extends StatefulWidget {
  const ChatDetail({
    Key? key,
    required this.chatId,
  }) : super(key: key);

  final chatId;

  @override
  State<ChatDetail> createState() => _ChatDetailState();
}

class _ChatDetailState extends State<ChatDetail> {
  String _contact = "";
  String _contactImg = "https://www.debate.com.mx/__export/1494286433102/sites/debate/img/2017/05/08/4b463f287cd814216b7e7b2e52e82687.png_2120446623.png";

  void _getData() async {
    final data = await getDetailData(int.parse(widget.chatId));
    setState(() {
      _contact = data["contact"];
      _contactImg = data["imageUrl"];
    });
  }

  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            goBack(context);
          },
          child: Row(
            children: [
              const Icon(Icons.arrow_back, color: Colors.white,),
              CircleAvatar(
                backgroundImage: NetworkImage(_contactImg),
                radius: 16,
              )
            ],
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(_contact),
      ),
      body: Center(
        child: Text("Chat with $_contact"),
      ),
    );
  }
}
