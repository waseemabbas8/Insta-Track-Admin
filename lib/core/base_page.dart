import 'package:get/get.dart';

abstract class BaseController extends GetxController {
  final RxBool _loadingData = false.obs;
  bool get loadingData => _loadingData.value;

  void setLoadingState(bool loading) {
    _loadingData.value = loading;
  }
}

abstract class BasePage<T extends BaseController> extends GetView<T> {
  const BasePage({super.key});
}