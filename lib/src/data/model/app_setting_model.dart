import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/app_setting_entity.dart';

part 'app_setting_model.g.dart';

@JsonSerializable()
class AppSettingModel extends AppSetting {
  AppSettingModel({
    super.languageCode = "en",
    super.themeMode = ThemeMode.system,
  });
  factory AppSettingModel.fromJson(Map<String, dynamic> jsonObj) =>
      _$AppSettingsModelFromJson(jsonObj);

  Map<String, dynamic> toJson() => _$AppSettingsModelToJson(this);
  String toRawJson() => json.encode(toJson());
}
