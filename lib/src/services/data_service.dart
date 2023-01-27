import 'dart:convert';

import 'package:flutter/services.dart';

Future<List> getData() async {
  final data = await rootBundle.loadString('assets/data/data.json');
  return jsonDecode(data);
}

Future getDetailData(int chatID) async {
  final data = await rootBundle.loadString('assets/data/data$chatID.json');
  return jsonDecode(data);
}