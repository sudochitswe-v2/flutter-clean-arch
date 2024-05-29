import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../presentation/pages/settings_page/settings_page_view_model.dart';
import '../presentation/pages/users_page/users_page_view_model.dart';
import '../presentation/utils/routes.dart';
import '../presentation/injector.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.settingsPageViewModel});

  final SettingsPageViewModel settingsPageViewModel;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => locator.get<SettingsPageViewModel>(),
        ),
        ChangeNotifierProvider(
          create: (_) => locator.get<UserPageViewModel>(),
        ),
      ],
      child: ListenableBuilder(
        listenable: settingsPageViewModel,
        builder: (context, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            // Providing a restorationScopeId allows the Navigator built by the
            // MaterialApp to restore the navigation stack when a user leaves and
            // returns to the app after it has been killed while running in the
            // background.
            restorationScopeId: 'app',

            // Define a light and dark color theme. Then, read the user's
            // preferred ThemeMode (light, dark, or system default) from the
            // SettingsController to display the correct theme.
            themeMode: settingsPageViewModel.setting.themeMode,
            theme: ThemeData(),
            darkTheme: ThemeData.dark(),
            routerConfig: routes,
          );
        },
      ),
    );
  }
}
