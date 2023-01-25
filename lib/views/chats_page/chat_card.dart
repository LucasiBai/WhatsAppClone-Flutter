import 'package:flutter/material.dart';
import 'package:whatsapp_clone/services/routing_service.dart';

class ChatCard extends StatelessWidget {
  ChatCard(
      {Key? key,
      required this.chatId,
      required this.contact,
      required this.time,
      required this.imageUrl,
      required this.message})
      : super(key: key);

  final int chatId;
  final String contact;
  String message;
  final String time;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        goToRoute(context, "/chats/$chatId");
      },
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
        radius: 25,
      ),
      title: Text(contact),
      subtitle: Text(message),
      trailing: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(time),
          ],
        ),
      ),
    );
  }
}
