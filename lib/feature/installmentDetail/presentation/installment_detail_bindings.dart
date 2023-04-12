import 'package:get/get.dart';
import 'installment_detail_controller.dart';

class InstallmentDetailBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InstallmentDetailController(), fenix: true);
  }
}
