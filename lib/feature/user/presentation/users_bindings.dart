import 'package:get/get.dart';

import '../data/repository/app_user_repository_impl.dart';
import '../domain/repository/app_user_repository.dart';
import '../domain/usecase/activate_user.dart';
import '../domain/usecase/get_users.dart';
import 'users_controller.dart';

class UsersBindings extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<AppUserRepository>(() => AppUserRepositoryImpl(fireStoreService: Get.find()));
    Get.lazyPut<GetUsersUseCase>(() => GetUsersUseCaseImpl(repo: Get.find()));
    Get.lazyPut<ActivateUserUseCase>(() => ActivateUserUseCaseImpl(userRepository: Get.find()));
    Get.lazyPut(() => UsersController(getUsers: Get.find(), activateUser: Get.find()), fenix: true);
  }
}