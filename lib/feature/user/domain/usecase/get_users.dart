import '../../../../core/data/exception.dart';
import '../../../../core/data/response.dart';
import '../../../../core/data/use_case.dart';
import '../model/app_user.dart';
import '../repository/app_user_repository.dart';

abstract class GetUsersUseCase implements ObservableUseCase<Result<List<AppUser>>, NoParams> {}

class GetUsersUseCaseImpl implements GetUsersUseCase {
  final AppUserRepository repo;

  GetUsersUseCaseImpl({required this.repo});

  @override
  Stream<Result<List<AppUser>>> call({required NoParams params}) {
    return repo.getUsers().map(
          (users) => users.isEmpty
              ? Result.error(FirebaseException.noDataException(msg: 'No users found'))
              : Result.success(users),
        );
  }
}
