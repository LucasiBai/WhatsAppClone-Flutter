import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void goToRoute( BuildContext context, String path){
  GoRouter.of(context).go(path);
}

void goBack(BuildContext context){
  Navigator.pop(context);
}