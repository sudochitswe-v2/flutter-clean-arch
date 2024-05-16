import 'package:flutter_new_project/src/presentation/pages/home_page/home_page.dart';
import 'package:flutter_new_project/src/presentation/pages/settings_page/settings_page.dart';
import 'package:flutter_new_project/src/presentation/pages/users_page/users_page.dart';
import 'package:go_router/go_router.dart';

final routes = GoRouter(
  routes: [
    GoRoute(
        path: '/',
        builder: (_, state) {
          return const HomePage();
        },
        routes: [
          GoRoute(
            path: UserPage.routeName,
            builder: (_, state) => const UserPage(),
          ),
          GoRoute(
            path: SettingsPage.routeName,
            builder: (_, state) => const SettingsPage(),
          ),
        ]),
  ],
);
