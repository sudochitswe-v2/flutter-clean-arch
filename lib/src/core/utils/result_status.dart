class ResultStatus<T> {
  final bool status;
  final String? message;
  final T? data;
  ResultStatus({this.status = false, this.message, this.data});
}
