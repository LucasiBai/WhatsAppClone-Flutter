import 'package:flutter/material.dart';

class ContactImage extends StatelessWidget {
  const ContactImage({Key? key, required this.onTap, required this.size, required this.imageUrl}) : super(key: key);

  final Function onTap;
  final double size;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: NetworkImage(imageUrl),
      radius: size,
    );
  }
}
