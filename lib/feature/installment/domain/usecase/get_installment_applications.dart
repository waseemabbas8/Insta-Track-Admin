import '../../../../core/data/exception.dart';
import '../../../../core/data/response.dart';
import '../../../../core/data/use_case.dart';
import '../model/installment_application.dart';
import '../repository/installment_repository.dart';

abstract class GetInstallmentApplicationsUseCase extends ObservableUseCase<Result<List<InstallmentApplication>>, NoParams> {}

class GetInstallmentApplicationsUseCaseImpl extends GetInstallmentApplicationsUseCase {
  final InstallmentRepository repo;

  GetInstallmentApplicationsUseCaseImpl(this.repo);

  @override
  Stream<Result<List<InstallmentApplication>>> call({required NoParams params}) {
    return repo.getApplications().map(
          (application) => application.isEmpty
          ? Result.error(FirebaseException.noDataException(msg: 'No Applications found'),)
          : Result.success(application),
    );
  }
}