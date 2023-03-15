import 'package:get/get.dart';
import 'package:intatrack/core/route/app_routes.dart';

import '../../core/base_page.dart';
import '../../core/data/response.dart';
import '../../core/data/use_case.dart';
import '../auth/domain/usecase/get_user.dart';

class RootController extends BaseController {
  final GetUserUserCase getUser;

  RootController({required this.getUser});

  @override
  void onInit() {
    fetchUser();
    super.onInit();
  }

  void fetchUser() async {
    setLoadingState(true);
    final result = await getUser.invoke(NoParams.getInstance());
    setLoadingState(false);
    if(result is SuccessResult) {
      _onSuccess();
    } else {
      _onFailure((result as ErrorResult).e.toString());
    }
  }

  void _onSuccess() {
    Get.toNamed(AppRoutes.home);
  }

  void _onFailure(String message) {
    Get.showSnackbar(GetSnackBar(title: "Error", message: message,));
  }

}