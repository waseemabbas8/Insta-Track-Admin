import '../../../../core/data/exception.dart';
import '../../../../core/data/response.dart';
import '../../../../core/data/use_case.dart';
import '../model/app_user.dart';
import '../repository/app_user_repository.dart';

abstract class GetUsersUseCase implements UseCase<List<AppUser>, NoParams> {}

class GetUsersUseCaseImpl implements GetUsersUseCase {
  final AppUserRepository repo;

  GetUsersUseCaseImpl({required this.repo});

  @override
  Future<Result<List<AppUser>>> call({required NoParams params}) async {
    try {
      final result = await repo.getUsers();
      if(result.isEmpty) {
        return Result.error(FirebaseException.noDataException(msg: "No users found"));
      }
      return Result.success(result);
    } catch (e) {
      return Result.error(FirebaseException.noDataException(msg: "Could not load data"));
    }
  }


}