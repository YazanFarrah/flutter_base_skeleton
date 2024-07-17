import 'package:anime_app/core/routes/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  GoRouter router = GoRouter(
    navigatorKey: Get.key,  // This makes sure that Get works with go_router
    routes: [
      GoRoute(
        path: '/',
        name: RoutePaths.userState,
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: Text("Home"),
          );
        },
      ),
    ],
  );
}
