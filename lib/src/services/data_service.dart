import 'dart:convert';

import 'package:flutter/services.dart';

Future<List> getData() async {
  final data = await rootBundle.loadString('assets/data.json');
  return jsonDecode(data);
}

Future getDetailData(int chatID) async {
  final data = await rootBundle.loadString('assets/data.json');
  final parsedData = await jsonDecode(data);
  
  final chatData =  parsedData.firstWhere((chat)=> chat["id"] == chatID);

  return chatData;
}