import 'package:get/get.dart';
import 'installments_controller.dart';

class InstallmentsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InstallmentsController(), fenix: true);
  }
}
