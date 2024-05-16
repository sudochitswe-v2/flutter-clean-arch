// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_setting_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppSettingModel _$AppSettingsModelFromJson(Map<String, dynamic> json) =>
    AppSettingModel(
      languageCode: json['languageCode'],
      themeMode: json['themeMode'],
    );

Map<String, dynamic> _$AppSettingsModelToJson(AppSettingModel instance) =>
    <String, dynamic>{
      'languageCode': instance.languageCode,
      'themeMode': _$ThemeModeEnumMap[instance.themeMode],
    };

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};
