
import '../../../../core/data/repository.dart';
import '../model/installment_application.dart';
import '../model/paid_installment.dart';

abstract class InstallmentRepository extends Repository {
  Stream<List<InstallmentApplication>> getApplications();

  Stream<List<PaidInstallment>> getListOfPaidInstallments(String applicationId);

  Future<InstallmentApplication?> getApplicationById(String id);

  Future<int> approveApplication(
      {required String id, required int totalCount, required int status});

  Future<int> incrementPaidCount({required String id, required int paidCount});
}
