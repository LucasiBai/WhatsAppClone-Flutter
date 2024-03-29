import 'package:flutter/material.dart';

import 'package:whatsapp_clone/src/services/routing_service.dart';
import 'package:whatsapp_clone/src/styles.dart';
import 'package:whatsapp_clone/src/themes.dart';

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
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Expanded(child: buildNavBar(context)))),
        ),
        body: const TabBarView(
          children: [CommunityPage(), ChatsPage(), StatusPage(), CallsPage()],
        ),
      ),
    );
  }

  TabBar buildNavBar(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final double tabWidth = (MediaQuery.of(context).size.width - 20) / 3;
    

    return TabBar(

      tabs:  [
        const SizedBox(
         width: 20,
          child: Tab(
            child: Icon(Icons.people),
          ),
        ),
        SizedBox(
          width: tabWidth,
          child: Tab(
            text: "Chats",
          ),
        ),
        SizedBox(
         width: tabWidth,
          child: Tab(
            text: "Estados",
          ),
        ),
        SizedBox(
          width: tabWidth,
          child: Tab(
            text: "Llamadas",
          ),
        ),
      ],
      labelColor:
          AppThemes.isDarkMode(context) ? colorScheme.secondary : Colors.white,
      unselectedLabelColor: Colors.white.withOpacity(0.7),
      indicatorColor:
          AppThemes.isDarkMode(context) ? colorScheme.secondary : Colors.white,
      indicatorWeight: 3,
    );
  }
}
