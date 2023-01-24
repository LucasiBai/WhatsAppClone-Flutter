import 'package:flutter/material.dart';
import 'package:whatsapp_clone/views/chats_page/chat_card.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ChatCard(contact: 'Javi ENP', time: '13:50', imageUrl: 'https://images.unsplash.com/photo-1616588945355-bb09c77baf29?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80', message: 'Hola, cómo va?',),
      ],
    );
  }
}
