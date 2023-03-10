import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';


Future<List> getData() async {
  final data = await rootBundle.loadString('assets/data/chat/data.json');
  return jsonDecode(data);
}

Future getDetailData(int chatID) async {
  final data = await rootBundle.loadString('assets/data/chat/data$chatID.json');
  return jsonDecode(data);
}

void addMessageTo(int chatID, String content)async{

  final Future<Directory?> directory = getExternalStorageDirectory();

  final File file = File("$directory/assets/data/chat/data$chatID.json");

  final data = await rootBundle.loadString('assets/data/chat/data$chatID.json');
  final parsedData = await jsonDecode(data);

  final newMessage = {
    "author": "YOU",
    "content": content,
    "time": "12:33"
  };

  parsedData["messages"].add(newMessage);

  file.writeAsStringSync(jsonEncode(parsedData));
}

Future<List> getStatusList() async {
  final data = await rootBundle.loadString('assets/data/status/data.json');
  return jsonDecode(data);
}

Future getStatusData(int chatID) async {
  final data = await rootBundle.loadString('assets/data/status/data$chatID.json');
  return jsonDecode(data);
}

Future<List> getCallList() async {
  final data = await rootBundle.loadString('assets/data/calls/data.json');
  return jsonDecode(data);
}