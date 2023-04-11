import 'package:intatrack/core/data/response.dart';

import '../../../../core/data/use_case.dart';
import '../model/contact.dart';
import '../repository/app_user_repository.dart';

class GetContactsParams {
  final String userId;

  GetContactsParams(this.userId);
}
abstract class GetContactsUseCase extends UseCase<List<Contact>, GetContactsParams>{}

class GetContactsUseCaseImpl extends GetContactsUseCase {
  final AppUserRepository userRepository;

  GetContactsUseCaseImpl({required this.userRepository});

  @override
  Future<Result<List<Contact>>> call({required GetContactsParams params}) async {
    return Result.success(await userRepository.getContacts(userId: params.userId));
  }
}