import 'dart:async';

import '../../model/app_setting_model.dart';
import '../../../../src/data/model/user_read_model.dart';

abstract class LocalStorage {
  Future<bool> saveSettings({required AppSettingModel settings});
  AppSettingModel loadAppSettings();
  List<UserReadModel> loadUsers({required int page});
  Future<bool> cacheUsers(
      {required int page, required List<UserReadModel> users});
}
