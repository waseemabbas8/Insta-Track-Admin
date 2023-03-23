import 'exception.dart';

class Result<T> {
  Result._();

  factory Result.success(T data) = SuccessResult;
  factory Result.error(FirebaseException e) = ErrorResult;
}

class ErrorResult<T> extends Result<T> {
  ErrorResult(this.e) : super._();

  final FirebaseException e;
}

class SuccessResult<T> extends Result<T> {
  SuccessResult(this.data) : super._();

  final T data;
}

///Generic response class
class GenericResponse<T> {
  final Result? result;
  final int? code;
  final T? data;

  GenericResponse({this.result, this.code, this.data});
}

///Response codes
class ResponseCode {
  ResponseCode._();

  static const int ok = 200;
  static const int error = 400;
}
