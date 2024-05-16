import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../presentation/pages/settings_page/settings_page_view_model.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class SettingsPage extends StatefulWidget {
  static const String routeName = "my_settings";
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: DropdownButton<ThemeMode>(
          value: context.select(
              (SettingsPageViewModel viewModel) => viewModel.setting.themeMode),
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
      ),
    );
  }
}
