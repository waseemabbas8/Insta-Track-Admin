import 'package:get/get.dart';
import '../../../core/base_page.dart';
import '../../../core/route/home_navigation.dart';
import '../../installment/domain/model/installment_application.dart';

class InstallmentDetailController extends BaseController {
  final RxList<InstallmentApplication> _installments = RxList();

  List<InstallmentApplication> get installments => _installments;

  @override
  void onInit() {
    _fetchInstallments();
    super.onInit();
  }

  @override
  void onBack() {
    Get.back(id: HomeNavigation.id);
  }

  void _fetchInstallments() {
    final List<InstallmentApplication> list = [
      InstallmentApplication(
        name: 'Ali',
        phone: '03084248718',
        product: 'iPhone',
        price: 50000,
        advance: '30000',
        installmentsCount: 5,
        createdAt: '2-2-2023',
      ),
      InstallmentApplication(
        name: 'Ali',
        phone: '03084248718',
        product: 'iPhone',
        price: 50000,
        advance: '30000',
        installmentsCount: 5,
        createdAt: '2-2-2023',
      ),
      InstallmentApplication(
        name: 'Ali',
        phone: '03084248718',
        product: 'iPhone',
        price: 50000,
        advance: '30000',
        installmentsCount: 5,
        createdAt: '2-2-2023',
      ),
      InstallmentApplication(
        name: 'Ali',
        phone: '03084248718',
        product: 'iPhone',
        price: 50000,
        advance: '30000',
        installmentsCount: 5,
        createdAt: '2-2-2023',
      ),
    ];
    _installments.value = list;
  }
}
