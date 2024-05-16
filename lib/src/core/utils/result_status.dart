import 'package:dartz/dartz.dart';

class ResultStatus<T> {
  final bool status;
  final String? message;
  final Data<T> data;
  ResultStatus({this.status = false, this.message, this.data});
}

typedef Data<T> = Either<T, List<T>>?;

Data<T> convertToListOf<T>(List<T> list) => Right(list);
Data<T> convertTo<T>(T data) => Left(data);
