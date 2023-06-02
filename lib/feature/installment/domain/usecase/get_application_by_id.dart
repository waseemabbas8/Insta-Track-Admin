import '../../../../core/data/exception.dart';
import '../../../../core/data/response.dart';
import '../../../../core/data/use_case.dart';
import '../model/installment_application.dart';
import '../repository/installment_repository.dart';

class GetApplicationByIdParam {
  final String applicationId;

  GetApplicationByIdParam({required this.applicationId});
}

abstract class GetApplicationByIdUseCase extends UseCase<InstallmentApplication, GetApplicationByIdParam> {}

class GetApplicationByIdUseCaseImpl extends GetApplicationByIdUseCase {
  final InstallmentRepository repo;

  GetApplicationByIdUseCaseImpl({required this.repo});

  @override
  Future<Result<InstallmentApplication>> call({required GetApplicationByIdParam params}) async {
    try {
      final result = await repo.getApplicationById(params.applicationId);
      return Result.success(result!);
    } catch (e) {
      return Result.error(FirebaseException.badRequest(msg: e.toString()));
    }
  }
}
