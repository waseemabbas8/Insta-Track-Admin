import 'package:intatrack/core/data/response.dart';

abstract class UseCase<T extends Object, Params extends Object> {
  Future<Result<T>> call({required Params params});
}

abstract class ObservableUseCase<T extends Object, Params extends Object> {
  Stream<T> call({required Params params});
}

class NoParams {
  const NoParams._();

  static NoParams? _instance;

  static NoParams getInstance() {
    _instance ??= const NoParams._();
    return _instance!;
  }
}