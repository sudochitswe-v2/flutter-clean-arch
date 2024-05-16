import 'package:flutter_new_project/src/data/model/app_setting_model.dart';
import 'package:flutter_new_project/src/domain/entities/app_setting_entity.dart';

abstract class AppSettingRepository {
  AppSetting loadAppSettings();
  Future<bool> saveAppSetting(AppSettingModel settingModel);
}
