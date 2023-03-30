import 'package:get/get.dart';

import 'user_detail_controller.dart';

class UserDetailBindings extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut(() => UserDetailController(user: Get.arguments[0]));
  }
}