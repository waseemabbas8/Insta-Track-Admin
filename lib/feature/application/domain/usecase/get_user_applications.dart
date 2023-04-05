import '../../../../core/data/exception.dart';
import '../../../../core/data/response.dart';
import '../../../../core/data/use_case.dart';
import '../model/user_application.dart';
import '../repository/user_application_repository.dart';

abstract class GetUserApplicationsUseCase implements UseCase<List<UserApplication>, NoParams> {}

class GetUsersUseCaseImpl implements GetUserApplicationsUseCase {
  final UserApplicationRepository repo;

  GetUsersUseCaseImpl({required this.repo});

  @override
  Future<Result<List<UserApplication>>> call({required NoParams params}) async {
    try {
      final result = await repo.getUsers();
      if(result is SuccessResult) {
        return Result.success(result);
      }
      return Result.error(FirebaseException.noDataException(msg: "Could not load data"));
    } catch (e) {
      return Result.error(FirebaseException.noDataException(msg: "Could not load data"));
    }
  }
}