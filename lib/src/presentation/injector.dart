import 'package:dio/dio.dart';
import 'package:flutter_new_project/src/data/repository/app_setting_repository_impl.dart';
import 'package:flutter_new_project/src/domain/repositories/app_setting_repository.dart';
import 'package:flutter_new_project/src/domain/usecases/load_app_settings_use_case.dart';
import 'package:flutter_new_project/src/domain/usecases/load_users_use_case.dart';
import 'package:flutter_new_project/src/domain/usecases/save_app_settings_use_case.dart';
import 'package:flutter_new_project/src/presentation/pages/settings_page/settings_page_view_model.dart';
import 'package:flutter_new_project/src/presentation/pages/users_page/users_page_view_model.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../src/data/data_source/local/local_storage.dart';
import '../../src/data/data_source/local/local_storage_impl.dart';
import '../../src/data/data_source/remote/api.dart';
import '../../src/data/data_source/remote/api_impl.dart';
import '../../src/data/repository/user_repository_impl.dart';
import '../../src/domain/repositories/user_repository.dart';

GetIt locator = GetIt.instance;

Future<void> injectDependency() async {
  await registerServices();
  registerRepositories();
  registerUseCases();
  registerViewModels();
}

Future<void> registerServices() async {
  var sharedPref = await SharedPreferences.getInstance();
  locator.registerLazySingleton(() => Dio());
  locator.registerLazySingleton<Api>(() => ApiImpl(dio: locator()));
  locator.registerFactory<LocalStorage>(
      () => LocalStorageImpl(sharedPreferences: sharedPref));
}

void registerUseCases() {
  locator.registerFactory(() => LoadAppsettingsUseCase(repository: locator()));
  locator.registerFactory(() => SaveAppSettingUseCase(repository: locator()));
  locator.registerFactory(() => LoadUsersUseCase(repsitory: locator()));
}

void registerRepositories() {
  locator.registerFactory<UserRepsitory>(() => UserRepositoryImpl(
        api: locator(),
        localStorage: locator(),
      ));
  locator.registerFactory<AppSettingRepository>(() => AppSettingRepositoryImpl(
        localStorage: locator(),
      ));
}

void registerViewModels() {
  locator.registerLazySingleton(() => SettingsPageViewModel(
        loadSettingUseCase: locator(),
        saveAppSettingUseCase: locator(),
      ));
  locator.registerLazySingleton(() => UserPageViewModel(
        loadUsersUseCase: locator(),
      ));
}
