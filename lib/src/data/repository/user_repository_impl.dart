import '../../core/utils/result_status.dart';
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
  Future<ResultStatus<List<User>>> getUsers({
    int page = 1,
    required int limit,
    required int skip,
  }) async {
    var cachedData = _localStorage.loadUsers(page: page);
    if (cachedData.isNotEmpty) {
      return ResultStatus(status: true, data: cachedData, message: "");
    }
    var result = await _api.getUsers(page: page, limit: limit, skip: skip);
    var data = result.data;
    if (data != null) {
      //await _localStorage.cacheUsers(page: page, users: data);
    }
    return result;
  }
}
