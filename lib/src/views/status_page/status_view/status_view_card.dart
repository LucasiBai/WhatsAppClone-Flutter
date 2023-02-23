import 'package:flutter/material.dart';

class StatusViewCard extends StatelessWidget {
  const StatusViewCard({Key? key, this.url}) : super(key: key);

  final url;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: Image.network(
          url,
          fit: BoxFit.contain,
        ),
      )
    ]);
  }
}
