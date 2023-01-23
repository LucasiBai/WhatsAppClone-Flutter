import 'package:flutter/material.dart';

import 'package:whatsapp_clone/views/calls.dart';
import 'package:whatsapp_clone/views/chats.dart';
import 'package:whatsapp_clone/views/status.dart';
import 'package:whatsapp_clone/views/community.dart';

class AppRouter extends StatefulWidget {
  const AppRouter({Key? key}) : super(key: key);

  @override
  State<AppRouter> createState() => _AppRouterState();
}

class _AppRouterState extends State<AppRouter>
    with SingleTickerProviderStateMixin {
  late TabController controller = TabController(length: 4, vsync: this);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("WhatsApp"),
          actions: [
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.camera_alt_outlined)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
          backgroundColor: Theme.of(context).colorScheme.primary,
          bottom: buildNavBar(),
        ),
        body: const TabBarView(
          children: [
              Community(),
              Chats(),
              Status(),
              Calls()
          ],
        ),
      ),
    );
  }

  TabBar buildNavBar() {
    return const TabBar(
      tabs: [
        Tab(
          icon: Icon(Icons.people),
        ),
        Tab(
          text: "CHATS",
        ),
        Tab(
          text: "ESTADOS",
        ),
        Tab(
          text: "LLAMADAS",
        ),
      ],
      indicatorColor: Colors.white,
      indicatorWeight: 3,
    );
  }
}
