import 'package:dio/dio.dart';
import 'package:flutter_new_project/src/core/utils/dio_excepion_handler.dart';
import 'package:flutter_new_project/src/data/model/user_read_model.dart';

import '../../../core/constants/urls.dart';
import '../../../core/utils/result_status.dart';
import '../../data_source/remote/api.dart';

class ApiImpl implements Api {
  final Dio _dio;
  ApiImpl({required Dio dio}) : _dio = dio;

  @override
  Future<ResultStatus<List<UserReadModel>>> getUsers({
    int page = 1,
    required int limit,
    required int skip,
  }) async {
    try {
      var url = "${Urls.users}?skip=$skip&limit=$limit";
      final response = await _dio.get(url);
      if (response.statusCode == 200) {
        var users = (response.data["users"] as List<dynamic>)
            .map((userJson) => UserReadModel.fromJson(userJson))
            .toList();
        return ResultStatus<List<UserReadModel>>(
          data: users,
          message: "",
          status: true,
        );
      }
      return ResultStatus();
    } on DioException catch (e) {
      return DioExceptionHandler.handleCatch(e);
    }
  }
}
