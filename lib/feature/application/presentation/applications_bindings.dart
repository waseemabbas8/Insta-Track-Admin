import 'package:get/get.dart';
import 'applications_controller.dart';

class ApplicationsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApplicationsController(), fenix: true);
  }
}
