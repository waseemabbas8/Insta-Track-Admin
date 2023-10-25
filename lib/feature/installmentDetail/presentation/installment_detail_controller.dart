import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intatrack/core/data/response.dart';
import 'package:intatrack/feature/installment/data/model/installment_count.dart';
import 'package:intatrack/feature/installment/domain/usecase/approve_application.dart';
import 'package:intatrack/feature/installment/domain/usecase/get_application_by_id.dart';
import '../../../core/base_page.dart';
import '../../../core/route/home_navigation.dart';
import '../../installment/domain/model/installment_application.dart';
import '../../user/domain/model/app_user.dart';
import '../../user/domain/usecase/get_user_by_id.dart';

class InstallmentDetailController extends BaseController {
  final TextEditingController totalICountController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final InstallmentApplication applicationObj;

  final GetUserByIdUseCase getUserByIdUseCase;

  final ApproveApplicationUseCase approveApplicationUseCase;


  InstallmentDetailController(
      {required this.approveApplicationUseCase,
      required this.getUserByIdUseCase,
      required this.applicationObj});

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
          isActive: false)
      .obs;

  AppUser get user => _user.value;

  @override
  void onInit() {
    _application = Rx(applicationObj);
    _fetchUserById(application.userId);
    super.onInit();
  }

  onSubmitICount() async {
    if (formKey.currentState?.validate() == false) return;
    setLoadingState(true);
    final result = await approveApplicationUseCase(
        params: ApproveApplicationParam(
            totalCount: int.parse(totalICountController.text),
            status: 1,
            applicationId: application.id));
    if (result is SuccessResult) {
      final approveApplication = InstallmentApplication(
        productInfo: application.productInfo,
        advance: application.advance,
        status: 1,
        installmentCount: Installment(application.installmentCount.paid,
            int.parse(totalICountController.text)),
        userInfo: application.userInfo,
        productId: application.productId,
        userId: application.userId,
        createdAt: application.createdAt,
        id: application.id,
      );
      _application.value = approveApplication;
    } else {
      showMessage(message: (result as Error).toString());
    }
    setLoadingState(false);
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
