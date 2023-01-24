import 'package:flutter/material.dart';
import 'package:whatsapp_clone/routing/app_router.dart';
import 'package:whatsapp_clone/views/camera_page/camera_page.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor:  Color(0xff00a884), secondary: Color(0xff25D366))
      ),
      routes: {
        "/camera": (context) => const Camera()
      },
      home: const AppRouter(),
    );
  }
}
