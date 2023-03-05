import 'package:flutter/material.dart';
import 'package:whatsapp_clone/src/services/data_service.dart';
import 'package:whatsapp_clone/src/services/routing_service.dart';
import 'package:whatsapp_clone/src/styles.dart';

class ContactImageView extends StatefulWidget {
  const ContactImageView({Key? key, this.userId, this.imageUrl})
      : super(key: key);

  final userId;
  final imageUrl;

  @override
  State<ContactImageView> createState() => _ContactImageViewState();
}

class _ContactImageViewState extends State<ContactImageView> {
  String _contact = "";
  String _contactImg = "";

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
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Column(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    goBack(context);
                  },
                  icon: const Icon(
                    AppIcons.backIcon,
                    color: Colors.white,
                  )),
              Text(
                _contact,
                style: const TextStyle(
                    color: Colors.white, fontSize: AppTexts.xlSize),
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: Hero(
                  tag: widget.userId,
                  child: Image.network(
                    widget.imageUrl == Null ? widget.imageUrl : _contactImg,
                    fit: BoxFit.cover,
                  )),
            ),
          )
        ],
      )),
    );
  }
}
