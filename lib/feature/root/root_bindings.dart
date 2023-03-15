import 'package:get/get.dart';

import '../auth/data/repository/user_repository_impl.dart';
import '../auth/domain/usecase/get_user.dart';
import '../auth/domain/usecase/login.dart';
import '../auth/domain/repository/user_repository.dart';
import 'root_controller.dart';

class RootBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserRepository>(() => UserRepositoryImpl());
    Get.lazyPut<GetUserUserCase>(() => GetUserUserCaseImpl(repo: Get.find()));
    Get.lazyPut<LoginUseCase>(() => LoginUseCaseImpl(repo: Get.find()));
    Get.lazyPut(() => RootController(getUser: Get.find()));
  }
}