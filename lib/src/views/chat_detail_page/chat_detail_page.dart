import 'package:flutter/material.dart';

import 'package:whatsapp_clone/src/services/data_service.dart';
import 'package:whatsapp_clone/src/services/routing_service.dart';
import 'package:whatsapp_clone/src/styles.dart';
import 'package:whatsapp_clone/src/views/chat_detail_page/chat_text_field.dart';
import 'package:whatsapp_clone/src/views/chat_detail_page/exit_chat_button.dart';
import 'package:whatsapp_clone/src/views/chat_detail_page/selectable_chat_bubble.dart';

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

  void _deleteMessages() {
    for (final message in _selectedMessages) {
      _deleteMessage(message);
    }

    _removeSelectMessages();
  }

  void _deleteMessage(message) {
    setState(() {
      _chatMessages =
          _chatMessages.where((item) => item["id"] != message["id"]).toList();
    });
  }

  void _selectMessage(message) {
    setState(() {
      _selectedMessages.add(message);
    });
  }

  void _switchSelectMessageState(message) {
    setState(() {
      if (_selectedMessages.contains(message)) {
        _selectedMessages.remove(message);
      } else {
        _selectedMessages.add(message);
      }
    });
  }

  void _removeSelectMessages() {
    setState(() {
      _selectedMessages = [];
    });
  }

  void _sendMessage(int userId, String msg) {
    DateTime now = new DateTime.now();

    setState(() {
      _chatMessages.add({
        "author": "YOU",
        "content": msg,
        "time": "${now.hour}:${now.minute}"
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      appBar: _selectedMessages.isNotEmpty
          ? _selectActionsAppBar(context)
          : _contactAppBar(context),
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(isDarkMode
                      ? "assets/images/background_dark.jpeg"
                      : "assets/images/background.jpeg"),
                  fit: BoxFit.cover)),
          child: ListView(
            children: [
              Container(
                padding: AppPaddings.mdVer,
                child: Column(
                  children: _renderMessages(context),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: ChatTextField(
            chatId: int.parse(widget.chatId),
            onSend: _sendMessage,
          ),
        )
      ]),
    );
  }

  AppBar _contactAppBar(BuildContext context) {
    return AppBar(
      leading: const SizedBox(),
      leadingWidth: 0,
      backgroundColor: Theme.of(context).colorScheme.primary,
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ExitChatButton(
                contactImg: _contactImg,
              ),
              Expanded(
                child: InkWell(
                  child: Container(
                      padding: AppPaddings.mdHor,
                      height: 55,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _contact,
                            style: TextStyle(fontSize: AppTexts.lSize),
                          ),
                          const Text(
                            "En linea",
                            style: TextStyle(
                                fontSize: AppTexts.mdSize,
                                fontWeight: AppTexts.smWeight),
                          )
                        ],
                      )),
                  onTap: () {
                    goToRoute(context, "/contactDetail/${widget.chatId}");
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(AppIcons.faceTimeIcon)),
        IconButton(onPressed: () {}, icon: const Icon(AppIcons.phoneIcon)),
        IconButton(onPressed: () {}, icon: const Icon(AppIcons.optionsIcon)),
      ],
    );
  }

  AppBar _selectActionsAppBar(BuildContext context) {
    return AppBar(
      leading: const SizedBox(),
      leadingWidth: 0,
      backgroundColor: Theme.of(context).colorScheme.primary,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
              onPressed: () {
                _removeSelectMessages();
              },
              icon: const Icon(AppIcons.backIcon)),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text("${_selectedMessages.length} mensajes seleccionados"),
          ),
        ],
      ),
      actions: [
        IconButton(
            onPressed: () {
              _deleteMessages();
            },
            icon: const Icon(AppIcons.deleteIcon)),
      ],
    );
  }

  List<Widget> _renderMessages(BuildContext context) {
    List<Widget> messages = [];
    for (final message in _chatMessages) {
      final bool ownMessage = message["author"].toUpperCase() == "YOU";

      final widget = SelectableChatBubble(
        onTap: (message) {
          if (_selectedMessages.isNotEmpty) _switchSelectMessageState(message);
        },
        onLongPress: (message) {
          if (_selectedMessages.isEmpty) _selectMessage(message);
        },
        message: message,
        selected: _selectedMessages.contains(message),
        ownMessage: ownMessage,
      );

      messages.add(widget);
    }
    return messages;
  }
}
