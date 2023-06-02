import 'package:get/get.dart';
import '../../installment/domain/usecase/approve_application.dart';
import '../../user/data/repository/app_user_repository_impl.dart';
import '../../user/domain/repository/app_user_repository.dart';
import '../../user/domain/usecase/get_user_by_id.dart';
import 'installment_detail_controller.dart';

class InstallmentDetailBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppUserRepository>(() => AppUserRepositoryImpl(fireStoreService: Get.find()));
    Get.lazyPut<GetUserByIdUseCase>(() => GetUserByIdUseCaseImpl(repo: Get.find()));
    Get.lazyPut<ApproveApplicationUseCase>(() => ApproveApplicationUseCaseImpl(repo: Get.find()));
    Get.lazyPut(
        () => InstallmentDetailController(
              applicationObj: Get.arguments[0],
              getUserByIdUseCase: Get.find(),
              approveApplicationUseCase: Get.find(),
            ),
        fenix: true);
  }
}
