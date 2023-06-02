import 'package:get/get.dart';
import 'package:intatrack/core/data/response.dart';
import 'package:intatrack/feature/installment/domain/usecase/get_installment_applications.dart';
import '../../../core/base_page.dart';
import '../../../core/data/use_case.dart';
import '../../../core/route/app_routes.dart';
import '../../../core/route/home_navigation.dart';
import '../domain/model/installment_application.dart';

class InstallmentsController extends BaseController {
  final GetInstallmentApplicationsUseCase _getInstallmentApplicationsUseCase;

  final RxList<InstallmentApplication> _userApplications = RxList();

  InstallmentsController(this._getInstallmentApplicationsUseCase);

  List<InstallmentApplication> get userApplications => _userApplications;

  List<InstallmentApplication> _initApplicationsList = List.empty();

  @override
  void onInit() {
    _observeApplications();
    super.onInit();
  }

  void _observeApplications() async {
    setLoadingState(true);
    _getInstallmentApplicationsUseCase(params: NoParams.getInstance())
        .listen((result) {
      if (result is SuccessResult) {
        _userApplications.value = (result as SuccessResult).data;
        _initApplicationsList = (result as SuccessResult).data;
      } else {
        _userApplications.value = List.empty();
      }
      setLoadingState(false);
    });
  }

  void onSearch(String value) {
    if (value.isEmpty) {
      _userApplications.value = _initApplicationsList;
      return;
    }
    // final tempUsers =
    //     userApplications.where((user) => user.matchesSearchResult(value));
    // _userApplications.value = tempUsers.toList();
  }

  onViewInstallmentDetail(InstallmentApplication application) {
    Get.toNamed(AppRoutes.installmentDetail,
        id: HomeNavigation.id, arguments: [application]);
  }
}
