import 'package:get/get.dart';
import 'package:intatrack/core/data/response.dart';
import '../../../core/base_page.dart';
import '../../../core/route/home_navigation.dart';
import '../../installment/domain/model/installment_application.dart';
import '../../user/domain/model/app_user.dart';
import '../../user/domain/usecase/get_user_by_id.dart';

class InstallmentDetailController extends BaseController {
  final InstallmentApplication applicationObj;

  final GetUserByIdUseCase getUserByIdUseCase;

  InstallmentDetailController(
      {required this.getUserByIdUseCase, required this.applicationObj});

  late Rx<InstallmentApplication> _application;

  InstallmentApplication get application => _application.value;

  final Rx<AppUser> _user = AppUser(
      id: '',
      name: '',
      email: '',
      nic: '',
      phone: '',
      city: '',
      address: '',
      createdAt: '',
      isActive: false).obs;

  AppUser get user => _user.value;

  @override
  void onInit() {
    _application = Rx(applicationObj);
    _fetchUserById(application.userId);
    super.onInit();
  }

  _fetchUserById(String userId) async {
    final result =
        await getUserByIdUseCase(params: GetUserByIdParam(userId: userId));
    if (result is SuccessResult) {
      _user.value = (result as SuccessResult).data;
    } else {
      showMessage(message: (result as Error).toString());
    }
  }

  @override
  void onBack() {
    Get.back(id: HomeNavigation.id);
  }
}
