import 'package:flutter/material.dart';

import 'package:whatsapp_clone/src/services/routing_service.dart';
import 'package:whatsapp_clone/src/styles.dart';

import 'package:whatsapp_clone/src/views/calls_page/calls_page.dart';
import 'package:whatsapp_clone/src/views/chats_page/chats_page.dart';
import 'package:whatsapp_clone/src/views/status_page/status_page.dart';
import 'package:whatsapp_clone/src/views/community_page.dart';

class AppRouter extends StatefulWidget {
  const AppRouter({Key? key}) : super(key: key);

  @override
  State<AppRouter> createState() => _AppRouterState();
}

class _AppRouterState extends State<AppRouter>
    with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: const Text("WhatsApp"),
          actions: [
            IconButton(
                onPressed: () {
                  goToRoute(context, "/camera");
                },
                icon: const Icon(AppIcons.cameraIcon)),
            IconButton(onPressed: () {}, icon: const Icon(AppIcons.searchIcon)),
            IconButton(
                onPressed: () {}, icon: const Icon(AppIcons.optionsIcon)),
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
