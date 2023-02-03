import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';

Future<List> getData() async {
  final data = await rootBundle.loadString('assets/data/data.json');
  return jsonDecode(data);
}

Future getDetailData(int chatID) async {
  final data = await rootBundle.loadString('assets/data/data$chatID.json');
  return jsonDecode(data);
}

void addMessageTo(int chatID, String content)async{

  final File file = File('../../assets/data/data$chatID.json');

  final data = await rootBundle.loadString('assets/data/data$chatID.json');
  final parsedData = await jsonDecode(data);

  final newMessage = {
    "author": "YOU",
    "content": content,
    "time": "12:33"
  };

  parsedData["messages"].add(newMessage);

  file.writeAsStringSync(jsonEncode(parsedData));

}