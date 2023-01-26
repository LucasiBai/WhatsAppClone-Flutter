import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'package:whatsapp_clone/src/routing/app_routes.dart';

void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "WhatsApp Clone",
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Color(0xff00a884), secondary: Color(0xff25D366))),
      routerConfig: Routes.config,
    );
  }
}

