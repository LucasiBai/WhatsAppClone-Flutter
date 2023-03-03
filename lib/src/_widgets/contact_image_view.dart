import 'package:flutter/material.dart';
import 'package:whatsapp_clone/src/services/data_service.dart';

class ContactImageView extends StatefulWidget {
  const ContactImageView({Key? key, this.userId}) : super(key: key);

  final userId;

  @override
  State<ContactImageView> createState() => _ContactImageViewState();
}

class _ContactImageViewState extends State<ContactImageView> {
  String _contact="";
  String _contactImg="";

  void _getData() async {
    final data = await getDetailData(int.parse(widget.userId));
    setState(() {
      _contact = data["contact"];
      _contactImg = data["imageUrl"];
    });
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_contact),
      ),
      body: Hero(
          tag: widget.userId,
          child: Image.network(_contactImg)
      ),
    );
  }
}
