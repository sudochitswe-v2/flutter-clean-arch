import '../../../src/core/utils/result_status.dart';
import '../../../src/domain/entities/user_entity.dart';
import '../../../src/domain/repositories/user_repository.dart';

class LoadUsersUseCase {
  LoadUsersUseCase({
    required UserRepsitory repsitory,
  }) : _repsitory = repsitory;
  final UserRepsitory _repsitory;

  Future<ResultStatus<User>> call({
    int page = 1,
    required int limit,
    required int skip,
  }) async {
    return await _repsitory.getUsers(page: page, limit: limit, skip: skip);
  }
}
