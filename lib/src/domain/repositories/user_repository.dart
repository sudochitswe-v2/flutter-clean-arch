import 'package:flutter_new_project/src/core/utils/result_status.dart';
import 'package:flutter_new_project/src/domain/entities/user_entity.dart';

abstract class UserRepsitory {
  Future<ResultStatus<User>> getUsers({
    int page = 1,
    required int limit,
    required int skip,
  });
}
