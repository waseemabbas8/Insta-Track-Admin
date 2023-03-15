import '../../../../core/data/response.dart';
import '../../../../core/data/use_case.dart';
import '../model/User.dart';
import '../repository/user_repository.dart';

abstract class GetUserUserCase extends UseCase<User, NoParams> {}

class GetUserUserCaseImpl extends GetUserUserCase {
  final UserRepository repo;

  GetUserUserCaseImpl({required this.repo});

  @override
  Future<Result<User>> invoke(NoParams params) async {
    final user = await repo.user;
    if(user != null) {
      return Result.success(user);
    }
    return Result.error(Exception("User not logged in."));
  }
}