import 'package:flutter/material.dart';
import 'package:flutter_new_project/src/presentation/my_app.dart';
import 'package:flutter_new_project/src/presentation/pages/settings_page/settings_page_view_model.dart';
import '../../../src/presentation/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injectDependency();

  runApp(MyApp(
    settingsPageViewModel: locator.get<SettingsPageViewModel>(),
  ));
}
