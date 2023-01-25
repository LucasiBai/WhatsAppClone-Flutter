import 'package:flutter/material.dart';

void goToRoute(BuildContext context, String path){
  Navigator.pushNamed(context, path);
}

void goBack(BuildContext context){
  Navigator.pop(context);
}