import 'package:flutter_new_project/src/data/data_source/local/local_storage.dart';
import 'package:flutter_new_project/src/data/model/app_setting_model.dart';
import 'package:flutter_new_project/src/domain/entities/app_setting_entity.dart';
import 'package:flutter_new_project/src/domain/repositories/app_setting_repository.dart';

class AppSettingRepositoryImpl implements AppSettingRepository {
  final LocalStorage _localStorage;
  AppSettingRepositoryImpl({
    required LocalStorage localStorage,
  }) : _localStorage = localStorage;
  @override
  AppSetting loadAppSettings() {
    return _localStorage.loadAppSettings();
  }

  @override
  Future<bool> saveAppSetting(AppSettingModel settingModel) {
    return _localStorage.saveSettings(settings: settingModel);
  }
}
