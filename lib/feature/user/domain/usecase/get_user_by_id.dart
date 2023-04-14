import '../../../../core/data/exception.dart';
import '../../../../core/data/response.dart';
import '../../../../core/data/use_case.dart';
import '../model/app_user.dart';
import '../repository/app_user_repository.dart';

class GetUserByIdParam {
  final String userId;

  GetUserByIdParam({required this.userId});
}

abstract class GetUserByIdUseCase extends UseCase<AppUser, GetUserByIdParam> {}

class GetUserByIdUseCaseImpl extends GetUserByIdUseCase {
  final AppUserRepository repo;

  GetUserByIdUseCaseImpl({required this.repo});

  @override
  Future<Result<AppUser>> call({required GetUserByIdParam params}) async {
    try {
      final result = await repo.getUserById(params.userId);
      return Result.success(result!);
    } catch (e) {
      return Result.error(FirebaseException.badRequest(msg: e.toString()));
    }
  }
}
