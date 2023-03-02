import 'package:flutter/material.dart';
import 'package:whatsapp_clone/src/services/data_service.dart';
import 'package:whatsapp_clone/src/services/routing_service.dart';
import 'package:whatsapp_clone/src/views/chats_page/chat_card.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  List _chatData = [];
  List _selectedChats = [];

  void _getChatsData() async {
    final data = await getData();

    setState(() {
      _chatData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    _getChatsData();
    return ListView(children: _getChats(_chatData));
  }

  List<ChatCard> _getChats(List chatData) {
    List<ChatCard> chatList = [];

    for (final chat in chatData) {
      chatList.add(ChatCard(
          onTap: () {
            if (_selectedChats.length > 0) {
              _selectChat(chat["id"]);
            } else {
              goToRoute(context, "/chats/${chat["id"]}");
            }
          },
          onLongPress: () {
            _selectChat(chat["id"]);
          },
          selected: _selectedChats.contains(chat["id"]),
          chatId: chat["id"],
          contact: chat["contact"],
          time: chat["message"]["time"],
          imageUrl: chat["imageUrl"],
          author: chat["message"]["author"],
          message: chat["message"]["content"]));
    }

    return chatList;
  }

  _selectChat(chatId) {
    setState(() {
      _selectedChats.add(chatId);
    });
  }
}
