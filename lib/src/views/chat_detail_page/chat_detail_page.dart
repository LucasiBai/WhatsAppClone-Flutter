import 'package:flutter/material.dart';

import 'package:whatsapp_clone/src/services/data_service.dart';
import 'package:whatsapp_clone/src/styles.dart';
import 'package:whatsapp_clone/src/views/chat_detail_page/chat_bubble.dart';
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

  List _selectedMessages = [];

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

  void _selectMessage(message) {
    setState(() {
      _selectedMessages.add(message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        leadingWidth: 0,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ExitChatButton(
              contactImg: _contactImg,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: InkWell(
                child: Text(_contact),
                onTap: () {},
              ),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(AppIcons.faceTimeIcon)),
          IconButton(onPressed: () {}, icon: const Icon(AppIcons.phoneIcon)),
          IconButton(onPressed: () {}, icon: const Icon(AppIcons.optionsIcon)),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background.jpeg"),
                fit: BoxFit.cover)),
        child: ListView(
          children: [
            Container(
              padding: AppPaddings.mdAll,
              child: Column(
                children: _renderMessages(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _renderMessages(BuildContext context) {
    List<Widget> messages = [];
    for (final message in _chatMessages) {
      final bool ownMessage = message["author"].toUpperCase() == "YOU";

      final widget = GestureDetector(
        onLongPress: () {
          _selectMessage(message);
        },
        child: Stack(children: [
          Align(
            alignment:
                ownMessage ? Alignment.centerRight : Alignment.centerLeft,
            child: ChatBubble(ownMessage: ownMessage, message: message),
          ),
          if (_selectedMessages.contains(message))
            Container(
              height: 222,
              width: 222,
              color: Theme.of(context).colorScheme.tertiary.withOpacity(0.3),
            )
        ]),
      );

      messages.add(widget);
    }
    return messages;
  }
}
