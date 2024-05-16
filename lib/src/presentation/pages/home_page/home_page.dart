import 'package:flutter/material.dart';
import 'package:flutter_new_project/src/presentation/pages/settings_page/settings_page.dart';
import 'package:flutter_new_project/src/presentation/pages/settings_page/settings_page_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void goToSettingPage(BuildContext context) {
    context.go(SettingsPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            DropdownButton<ThemeMode>(
              value: context.select((SettingsPageViewModel viewModel) =>
                  viewModel.setting.themeMode),
              onChanged: (themeMode) => {
                if (themeMode != null)
                  {
                    context
                        .read<SettingsPageViewModel>()
                        .changeThemeMode(themeMode),
                  }
              },
              items: const [
                DropdownMenuItem(
                  value: ThemeMode.system,
                  child: Text('System Theme'),
                ),
                DropdownMenuItem(
                  value: ThemeMode.light,
                  child: Text('Light Theme'),
                ),
                DropdownMenuItem(
                  value: ThemeMode.dark,
                  child: Text('Dark Theme'),
                )
              ],
            ),
            ElevatedButton(
              onPressed: () => goToSettingPage,
              child: const Text("Go to Setting"),
            ),
            ElevatedButton(
                onPressed: () => context.go("/users"),
                child: const Text("Go Users Page"))
          ],
        ),
      ),
    );
  }
}
