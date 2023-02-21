import 'package:flutter/material.dart';

class StatusViewCard extends StatelessWidget {
  const StatusViewCard({Key? key, this.url}) : super(key: key);

  final url;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.network(
        url,
      ),
    );
  }
}
