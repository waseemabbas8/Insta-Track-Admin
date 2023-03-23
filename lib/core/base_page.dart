import 'package:get/get.dart';

import 'route/navigation_service.dart';

abstract class BaseController extends GetxController with NavigationService {
  final RxBool _loadingData = false.obs;

  bool get loadingData => _loadingData.value;

  void setLoadingState(bool loading) {
    _loadingData.value = loading;
  }

  void showMessage({String title = "Error", required String message}) {
    Get.showSnackbar(GetSnackBar(
      title: title,
      message: message,
      duration: const Duration(seconds: 3),
    ));
  }

}

abstract class BasePage<T extends BaseController> extends GetView<T> {
  const BasePage({super.key});
}
