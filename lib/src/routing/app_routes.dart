import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:whatsapp_clone/src/routing/app_router.dart';
import 'package:whatsapp_clone/src/views/camera_page/camera_page.dart';
import 'package:whatsapp_clone/src/views/chat_detail_page/chat_detail_page.dart';
import 'package:whatsapp_clone/src/views/status_page/status_view/status_view.dart';

class Routes {
  static final GoRouter _router = GoRouter(routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const AppRouter();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'camera',
          builder: (BuildContext context, GoRouterState state) {
            return const Camera();
          },
        ),
        GoRoute(
          path: 'chats/:chatId',
          builder: (BuildContext context, GoRouterState state) {
            final chatId = state.params["chatId"];
            return ChatDetail(chatId: chatId);
          },
        ),
        GoRoute(
          path: 'status/:userId',
          builder: (BuildContext context, GoRouterState state) {
            final userId = state.params["userId"];
            return StatusView(userId: userId);
          },
        ),
      ],
    ),
  ]);

  static final config = _router;
}
