import 'package:flutter/material.dart';
import 'package:flutter_new_project/src/data/model/app_setting_model.dart';
import 'package:flutter_new_project/src/domain/entities/app_setting_entity.dart';
import 'package:flutter_new_project/src/domain/usecases/load_app_settings_use_case.dart';
import 'package:flutter_new_project/src/domain/usecases/save_app_settings_use_case.dart';

class SettingsPageViewModel extends ChangeNotifier {
  final LoadAppsettingsUseCase _loadSettingUseCase;
  final SaveAppSettingUseCase _saveSettingUseCase;
  SettingsPageViewModel({
    required LoadAppsettingsUseCase loadSettingUseCase,
    required SaveAppSettingUseCase saveAppSettingUseCase,
  })  : _loadSettingUseCase = loadSettingUseCase,
        _saveSettingUseCase = saveAppSettingUseCase;
  AppSetting _setting = AppSetting(
    languageCode: "en",
    themeMode: ThemeMode.system,
  );
  AppSetting get setting => _setting;

  void loadSettings() {
    _setting = _loadSettingUseCase.call();
    // Important! Inform listeners a change has occurred.
    notifyListeners();
  }

  void changeThemeMode(ThemeMode themeMode) {
    _setting = AppSetting(
      languageCode: _setting.languageCode,
      themeMode: themeMode,
    );
    notifyListeners();
  }

  void saveSettings(AppSettingModel settingModel) {
    _saveSettingUseCase.call(settingModel);
  }
}
