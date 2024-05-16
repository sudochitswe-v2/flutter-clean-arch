import 'package:flutter_new_project/src/data/model/app_setting_model.dart';
import 'package:flutter_new_project/src/domain/repositories/app_setting_repository.dart';

class SaveAppSettingUseCase {
  final AppSettingRepository _repository;
  SaveAppSettingUseCase({required AppSettingRepository repository})
      : _repository = repository;

  Future<bool> call(AppSettingModel settingModel) async {
    return await _repository.saveAppSetting(settingModel);
  }
}
