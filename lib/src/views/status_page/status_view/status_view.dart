import 'package:flutter/material.dart';
import 'package:whatsapp_clone/src/services/data_service.dart';
import 'package:whatsapp_clone/src/views/status_page/status_view/status_view_card.dart';

class StatusView extends StatefulWidget {
  const StatusView({Key? key, this.userId}) : super(key: key);
  final userId;

  @override
  State<StatusView> createState() => _StatusViewState();
}

class _StatusViewState extends State<StatusView> {
  List _urls = [];

  int _currentIdx = 0;

  void getData() async {
    final data = await getStatusData(int.parse(widget.userId));
    setState(() {
      _urls = data["stories"];
    });
  }

  void nextStatus() {
    final lastIdx = _urls.length - 1 ;

    setState(() {
      _currentIdx = _currentIdx < lastIdx ? _currentIdx + 1 : 0;
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
        GestureDetector(
          onTap: () {
            nextStatus();
          },
          child: StatusViewCard(url: _urls[_currentIdx]),
        )
      ],
    );
  }
}
