import 'package:intatrack/core/data/response.dart';

abstract class UseCase<T extends Object, Params extends Object> {
  Future<Result<T>> invoke(Params params);
}

class NoParams {
  const NoParams._();

  static NoParams? _instance;

  static NoParams getInstance() {
    _instance ??= const NoParams._();
    return _instance!;
  }
}