
import '../../../../core/data/repository.dart';
import '../model/installment_application.dart';

abstract class InstallmentRepository extends Repository {
  Stream<List<InstallmentApplication>> getApplications();
}