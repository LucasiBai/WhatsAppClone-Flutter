import 'dart:convert';

import 'package:flutter/services.dart';

Future<List> getData() async {
  final data = await rootBundle.loadString('assets/data.json');
  return jsonDecode(data);
}