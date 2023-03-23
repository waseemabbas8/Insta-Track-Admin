import '../../../../core/data/exception.dart';
import '../../../../core/data/response.dart';
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
  Future<Result<User>> call({required LoginParams params}) async {
    try{
      final user = await repo.login(email: params.email, password: params.password);
      return Result.success(user!);
    } catch(e) {
      return Result.error(FirebaseException.authException(msg: "Invalid email or password"));
    }
  }
}
