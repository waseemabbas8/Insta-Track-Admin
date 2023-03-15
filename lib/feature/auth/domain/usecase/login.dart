import 'package:intatrack/core/data/response.dart';

import '../../../../core/data/use_case.dart';
import '../model/User.dart';
import '../repository/user_repository.dart';

class LoginParams {
  final String email;
  final String password;

  LoginParams({required this.email, required this.password});
}

abstract class LoginUseCase implements UseCase<User, LoginParams> {}

class LoginUseCaseImpl implements LoginUseCase {
  final UserRepository repo;

  LoginUseCaseImpl({required this.repo});

  @override
  Future<Result<User>> invoke(LoginParams params) async {
    final user = await repo.login(email: "email", password: "password");
    if(user != null) return Result.success(user);
    return Result.error(Exception("Invalid User or email"));
  }
}
