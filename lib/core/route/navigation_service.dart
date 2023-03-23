import 'package:get/get.dart';

mixin NavigationService {
  void replaceRoute(String route, {dynamic arguments}) {
    Get.offNamed(route, arguments: arguments);
  }

  void pushRoute(String route, {dynamic arguments}) {
    Get.toNamed(route, arguments: arguments);
  }

  void onBack() {
    Get.back();
  }
}