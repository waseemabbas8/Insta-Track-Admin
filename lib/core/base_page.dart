import 'package:get/get.dart';

abstract class BaseController extends GetxController {
  final RxBool _loadingData = false.obs;

  bool get loadingData => _loadingData.value;

  void setLoadingState(bool loading) {
    _loadingData.value = loading;
  }

  void showMessage({String title = "Error", required String message}) {
    Get.showSnackbar(GetSnackBar(
      title: title,
      message: message,
    ));
  }

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

abstract class BasePage<T extends BaseController> extends GetView<T> {
  const BasePage({super.key});
}
