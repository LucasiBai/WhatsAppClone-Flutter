import 'package:flutter/material.dart';

import 'package:whatsapp_clone/services/routing_service.dart';

import 'package:whatsapp_clone/views/calls_page/calls_page.dart';
import 'package:whatsapp_clone/views/chats_page/chats_page.dart';
import 'package:whatsapp_clone/views/status_page/status_page.dart';
import 'package:whatsapp_clone/views/community_page.dart';

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
                onPressed: () {
                  goToRoute(context, "/camera");
                },
                icon: const Icon(Icons.camera_alt_outlined)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
          backgroundColor: Theme.of(context).colorScheme.primary,
          bottom: buildNavBar(),
        ),
        body: const TabBarView(
          children: [CommunityPage(), ChatsPage(), StatusPage(), CallsPage()],
        ),
      ),
    );
  }

  TabBar buildNavBar() {
    return const TabBar(
      labelPadding: EdgeInsets.all(0),
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
