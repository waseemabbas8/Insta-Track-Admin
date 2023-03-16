import 'package:get/get.dart';

import '../../domain/usecase/login.dart';
import 'login_controller.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginUseCase>(() => LoginUseCaseImpl(repo: Get.find()));
    Get.lazyPut(() => LoginController(login: Get.find()));
  }
}