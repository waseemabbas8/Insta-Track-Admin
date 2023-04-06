import '../../../../core/data/exception.dart';
import '../../../../core/data/response.dart';
import '../../../../core/data/use_case.dart';
import '../model/installment_application.dart';
import '../repository/installment_repository.dart';

abstract class GetInstallmentApplicationsUseCase implements ObservableUseCase<List<InstallmentApplication>, NoParams> {}

class GetInstallmentApplicationsUseCaseImpl implements GetInstallmentApplicationsUseCase {
  final InstallmentRepository repo;

  GetInstallmentApplicationsUseCaseImpl({required this.repo});

  @override
  Stream<List<InstallmentApplication>> call({required NoParams params}) {
    // TODO: implement call
    throw UnimplementedError();
  }
}