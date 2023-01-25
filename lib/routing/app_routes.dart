import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:whatsapp_clone/routing/app_router.dart';
import 'package:whatsapp_clone/views/camera_page/camera_page.dart';

class Routes{
  static final GoRouter _router = GoRouter(routes:
  <RouteBase>[
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
      ],
    ),
  ]);

  static final config = _router;
}