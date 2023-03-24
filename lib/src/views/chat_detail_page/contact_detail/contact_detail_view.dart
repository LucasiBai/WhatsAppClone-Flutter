import 'package:flutter/material.dart';
import 'package:whatsapp_clone/src/services/data_service.dart';

class ContactDetailView extends StatefulWidget {
  const ContactDetailView({Key? key, required this.userId}) : super(key: key);

  final userId;

  @override
  State<ContactDetailView> createState() => _ContactDetailViewState();
}

class _ContactDetailViewState extends State<ContactDetailView> {
  Map _contactData = {};

  void _getContactData () async{
    final data = await getDetailData(int.parse(widget.userId));

    setState(() {
      _contactData = data;
    });
  }

  @override
  void initState() {
    super.initState();
    _getContactData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("${_contactData["id"]}")),
    );
  }
}
