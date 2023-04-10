import 'package:intatrack/core/data/exception.dart';
import '../../../../core/data/response.dart';
import '../../../../core/data/use_case.dart';
import '../repository/app_user_repository.dart';

class ActivateUserParams {
  final String userId;
  final bool active;

  ActivateUserParams({required this.userId, required this.active});
}

abstract class ActivateUserUseCase extends UseCase<int, ActivateUserParams> {}

class ActivateUserUseCaseImpl extends ActivateUserUseCase {
  final AppUserRepository userRepository;

  ActivateUserUseCaseImpl({required this.userRepository});

  @override
  Future<Result<int>> call({required ActivateUserParams params}) async {
    try {
      final result = await userRepository.activateUser(id: params.userId, active: params.active);
      return Result.success(result);
    } catch (e) {
      return Result.error(FirebaseException.badRequest(msg: e.toString()));
    }
  }
}