import 'package:flutter_new_project/src/core/utils/result_status.dart';
import 'package:flutter_new_project/src/domain/entities/user_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:flutter_new_project/src/domain/usecases/load_users_use_case.dart';
import 'package:flutter_new_project/src/domain/repositories/user_repository.dart';

import '../../../fixtures/fixtures.dart';

class MockUserRepository extends Mock implements UserRepsitory {}

void main() {
  // prepare variable to be load
  late LoadUsersUseCase loadUsers;
  late MockUserRepository mockUserRepository;
  late List<User> mockUsers;
  setUp(() {
    // prepare variable loaded
    mockUserRepository = MockUserRepository();
    loadUsers = LoadUsersUseCase(repsitory: mockUserRepository);
    mockUsers = getMockUsers();
  });
  // groups of test cases
  group("Load users ", () {
    test("should return list of users ", () async {
      const existingNoOfData = 0;
      const rowPerPage = 10;
      var mockResult = ResultStatus(data: mockUsers, message: "", status: true);
      // mocktail method to invoke http
      when(
        () => mockUserRepository.getUsers(
            limit: rowPerPage, skip: existingNoOfData),
      ).thenAnswer((_) async => mockResult);
      final result =
          await loadUsers.call(limit: rowPerPage, skip: existingNoOfData);
      expect(result, equals(mockResult));
      verify(() => mockUserRepository.getUsers(
          limit: rowPerPage, skip: existingNoOfData)).called(1);
      verifyNoMoreInteractions(mockUserRepository);
    });
  });
}
