import 'package:flutter/material.dart';
import 'package:whatsapp_clone/services/data_service.dart';
import 'package:whatsapp_clone/views/chats_page/chat_card.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  State<ChatsPage> createState() => _ChatsPageState();

}

class _ChatsPageState extends State<ChatsPage> {
  List _chatData = [];

  void _getChatsData() async{
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
          contact: chat["contact"],
          time: chat["time"],
          imageUrl: chat["imageUrl"],
          message: chat["message"]));
    }

    return chatList;
  }
}

