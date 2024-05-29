import 'package:flutter_new_project/src/core/utils/result_status.dart';
import 'package:flutter_new_project/src/data/model/user_read_model.dart';

abstract class Api {
  Future<ResultStatus<List<UserReadModel>>> getUsers({
    int page = 1,
    required int limit,
    required int skip,
  });
}
