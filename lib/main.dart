import 'package:flutter/material.dart';
import 'package:whatsapp_clone/routing/app_router.dart';

void main(){
  runApp(
    const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "WhatsApp Clone",
      theme: ThemeData(
        primaryColor: const Color(0xff075E54),
        secondaryHeaderColor: const Color(0xff25D366),
      ),
      home: AppRouter(),
    );
  }
}
