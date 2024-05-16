import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../src/core/constants/share_pref_key.dart';
import '../../../../src/data/model/app_setting_model.dart';
import '../../../../src/data/model/user_read_model.dart';
import '../../../../src/data/data_source/local/local_storage.dart';

class LocalStorageImpl implements LocalStorage {
  final SharedPreferences _sharedPref;
  LocalStorageImpl({required SharedPreferences sharedPreferences})
      : _sharedPref = sharedPreferences;

  @override
  List<UserReadModel> loadUsers({required int page}) {
    final key = getKeyToPage(page);
    final jsonList = _sharedPref.getStringList(key);

    return jsonList != null
        ? jsonList.map((e) => UserReadModel.fromJson(json.decode(e))).toList()
        : [];
  }

  String getKeyToPage(int page) {
    return '${cacheUsersKey}_$page';
  }

  @override
  Future<bool> cacheUsers(
      {required int page, required List<UserReadModel> users}) {
    final jsons = users.map((user) => user.toRawJosn()).toList();
    final key = getKeyToPage(page);
    return _sharedPref.setStringList(key, jsons);
  }

  @override
  Future<bool> saveSettings({required AppSettingModel settings}) async {
    return await _sharedPref.setString(
        cacheAppSettingsKey, settings.toRawJson());
  }

  @override
  AppSettingModel loadAppSettings() {
    final jsonData = _sharedPref.getString(cacheAppSettingsKey);
    return jsonData != null
        ? AppSettingModel.fromJson(json.decode(jsonData))
        : AppSettingModel();
  }
}
