import 'package:get/get.dart';
import '../data/repository/installment_repository_impl.dart';
import '../domain/repository/installment_repository.dart';
import '../domain/usecase/get_installment_applications.dart';
import 'installments_controller.dart';

class InstallmentsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InstallmentRepository>(() => InstallmentRepositoryImpl(Get.find()));
    Get.lazyPut<GetInstallmentApplicationsUseCase>(() => GetInstallmentApplicationsUseCaseImpl(Get.find()));
    Get.lazyPut(() => InstallmentsController(Get.find()), fenix: true);
  }
}
