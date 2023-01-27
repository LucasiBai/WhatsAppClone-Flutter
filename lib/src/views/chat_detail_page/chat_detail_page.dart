import 'package:flutter/material.dart';

import 'package:whatsapp_clone/src/services/data_service.dart';
import 'package:whatsapp_clone/src/styles.dart';
import 'package:whatsapp_clone/src/views/chat_detail_page/exit_chat_button.dart';

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
  String _contactImg =
      "https://www.debate.com.mx/__export/1494286433102/sites/debate/img/2017/05/08/4b463f287cd814216b7e7b2e52e82687.png_2120446623.png";
  List _chatMessages = [];

  void _getData() async {
    final data = await getDetailData(int.parse(widget.chatId));
    setState(() {
      _contact = data["contact"];
      _contactImg = data["imageUrl"];
      _chatMessages = data["messages"];
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
        leading: ExitChatButton(
          contactImg: _contactImg,
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: InkWell(
          child: Text(_contact),
          onTap: () {},
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(AppIcons.faceTimeIcon)),
          IconButton(onPressed: () {}, icon: const Icon(AppIcons.phoneIcon)),
          IconButton(onPressed: () {}, icon: const Icon(AppIcons.optionsIcon)),
        ],
      ),
      body: Container(
        color: Colors.black26,
        child: Column(
          children: _renderMessages(context),
        ),
      ),
    );
  }

  List<Widget> _renderMessages(BuildContext context) {
    List<Widget> messages = [];
    for (final message in _chatMessages) {
      final widget = Text("${message["content"]} ${message["time"]} ${message["author"]}");

      messages.add(widget);
    }
    return messages;
  }
}
