import 'package:flutter/material.dart';
import 'package:whatsapp_clone/src/services/routing_service.dart';

class ContactDialog extends StatelessWidget {
  const ContactDialog({Key? key, this.userId, this.userImg}) : super(key: key);

  final userId;
  final userImg;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.white.withOpacity(0),
        content: GestureDetector(
          onTap: () {
            goToRoute(context, "/contactImage/$userId");
          },
          child: Hero(
              tag: "contact-$userId",
              child: SizedBox(
                width: 300,
                height: 300,
                child: Image.network(
                  userImg,
                  fit: BoxFit.cover,
                ),
              )),
        ));
  }
}
