import 'package:get/get.dart';

import 'users_controller.dart';

class UsersBindings extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => UsersController(), fenix: true);
  }
}