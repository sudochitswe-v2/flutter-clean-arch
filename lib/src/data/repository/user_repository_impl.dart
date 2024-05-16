import 'package:dartz/dartz.dart';

import '../../core/utils/result_status.dart';
import '../../data/model/user_read_model.dart';
import '../../data/data_source/local/local_storage.dart';
import '../../data/data_source/remote/api.dart';
import '../../domain/repositories/user_repository.dart';
import '../../domain/entities/user_entity.dart';

class UserRepositoryImpl implements UserRepsitory {
  final Api _api;
  final LocalStorage _localStorage;

  UserRepositoryImpl({
    required Api api,
    required LocalStorage localStorage,
  })  : _api = api,
        _localStorage = localStorage;

  @override
  Future<ResultStatus<User>> getUsers({
    int page = 1,
    required int limit,
    required int skip,
  }) async {
    var cachedData = _localStorage.loadUsers(page: page);
    if (cachedData.isNotEmpty) {
      return ResultStatus(status: true, data: Right(cachedData), message: "");
    }
    var result = await _api.getUsers(page: page, limit: limit, skip: skip);
    var data = result.data?.fold<List<UserReadModel>>((l) => [], (r) => r);
    if (data != null) {
      //await _localStorage.cacheUsers(page: page, users: data);
    }
    return result;
  }
}
