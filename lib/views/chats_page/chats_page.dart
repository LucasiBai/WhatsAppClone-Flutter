import 'package:flutter/material.dart';
import 'package:whatsapp_clone/views/chats_page/chat_card.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const[
        ChatCard(),
      ],
    );
  }
}
