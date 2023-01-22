import 'package:flutter/material.dart';

class AppRouter extends StatefulWidget {
  const AppRouter({Key? key}) : super(key: key);

  @override
  State<AppRouter> createState() => _AppRouterState();
}

class _AppRouterState extends State<AppRouter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WhatsApp"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
