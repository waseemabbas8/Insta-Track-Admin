import '../../../../core/data/exception.dart';
import '../../../../core/data/response.dart';
import '../../../../core/data/use_case.dart';
import '../model/installment_application.dart';
import '../repository/installment_repository.dart';

class ApproveApplicationParam {
  final String applicationId;
  final int totalCount;
  final int status;

  ApproveApplicationParam(
      {required this.totalCount,
      required this.status,
      required this.applicationId});
}

abstract class ApproveApplicationUseCase
    extends UseCase<int, ApproveApplicationParam> {}

class ApproveApplicationUseCaseImpl extends ApproveApplicationUseCase {
  final InstallmentRepository repo;

  ApproveApplicationUseCaseImpl({required this.repo});

  @override
  Future<Result<int>> call({required ApproveApplicationParam params}) async {
    try {
      final result = await repo.approveApplication(
          id: params.applicationId,
          totalCount: params.totalCount,
          status: params.status);
      return Result.success(result);
    } catch (e) {
      return Result.error(FirebaseException.badRequest(msg: e.toString()));
    }
  }
}
