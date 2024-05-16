import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/user_entity.dart';

part 'user_read_model.g.dart';

@JsonSerializable()
class UserReadModel extends User {
  const UserReadModel({
    required int id,
    required String firstName,
    required String lastName,
    required String maidenName,
    required int age,
    required String gender,
    required String email,
    required String phone,
    required String username,
    required String password,
    required String birthDate,
    required String image,
  }) : super(
            id: id,
            firstName: firstName,
            lastName: lastName,
            maidenName: maidenName,
            age: age,
            gender: gender,
            email: email,
            phone: phone,
            username: username,
            password: password,
            birthDate: birthDate,
            image: image);

  factory UserReadModel.fromJson(Map<String, dynamic> jsonObj) =>
      _$UserReadModelFromJson(jsonObj);

  Map<String, dynamic> toJson() => _$UserReadModelToJson(this);

  String toRawJosn() => json.encode(toJson());
}
