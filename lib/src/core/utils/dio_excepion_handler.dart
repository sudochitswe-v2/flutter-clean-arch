import 'package:dio/dio.dart';
import 'package:flutter_new_project/src/core/utils/result_status.dart';

class DioExceptionHandler {
  static ResultStatus<T> handleCatch<T>(DioException error) {
    switch (error.type) {
      case DioExceptionType.receiveTimeout:
        return ResultStatus<T>(
          data: null,
          message: error.message ?? "Connection timeout",
          status: false,
        );
      case DioExceptionType.badResponse:
        return ResultStatus<T>(
          data: null,
          message: error.message ?? "Bad response",
          status: false,
        );
      case DioExceptionType.sendTimeout:
        return ResultStatus<T>(
          data: null,
          message: error.message ?? "Connection timeout",
          status: false,
        );
      case DioExceptionType.connectionError:
        return ResultStatus<T>(
          data: null,
          message: error.message ?? "Server can't be response right now",
          status: false,
        );
      case DioExceptionType.unknown:
        return ResultStatus<T>(
          data: null,
          message: error.message ?? "Network connection error.",
          status: false,
        );
      case DioExceptionType.badCertificate:
        return ResultStatus<T>(
          data: null,
          message: error.message ?? "Bad certificate.",
          status: false,
        );
      default:
        return ResultStatus<T>(
          data: null,
          message: "network related problem occur",
          status: false,
        );
    }
  }
}
