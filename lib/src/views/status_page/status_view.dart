import 'package:flutter/material.dart';
import 'package:whatsapp_clone/src/services/data_service.dart';


class StatusView extends StatefulWidget{
  const StatusView({Key? key, this.userId}) : super(key: key);
  final userId;

  @override
  State<StatusView> createState() => _StatusViewState();
}

class _StatusViewState extends State<StatusView> {
  String _url = "https://www.gravatar.com/avatar/16c1ef3ec3d82fb7e2eb80d479c64414?s=256&d=identicon&r=PG";

  void getData()async{
    final data = await getStatusData(int.parse(widget.userId));
    setState(() {
      _url = data["stories"][1];
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(child: Image.network(_url)),
      ],
    );
  }

  }

