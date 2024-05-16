import 'package:flutter_new_project/src/domain/entities/app_setting_entity.dart';
import 'package:flutter_new_project/src/domain/repositories/app_setting_repository.dart';

class LoadAppsettingsUseCase {
  LoadAppsettingsUseCase({
    required AppSettingRepository repository,
  }) : _repository = repository;

  final AppSettingRepository _repository;

  AppSetting call() {
    final setting = _repository.loadAppSettings();
    return setting;
  }
}
