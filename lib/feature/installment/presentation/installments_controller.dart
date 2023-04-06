import 'package:get/get.dart';
import '../../../core/base_page.dart';
import '../../../core/route/app_routes.dart';
import '../../../core/route/home_navigation.dart';
import '../domain/model/installment_application.dart';

class InstallmentsController extends BaseController {
  final RxList<InstallmentApplication> _userApplications = RxList();

  List<InstallmentApplication> get userApplications => _userApplications;

  List<InstallmentApplication> _initUsersList = List.empty();

  @override
  void onInit() {
    _fetchAppUsers();
    super.onInit();
  }

  void _fetchAppUsers() async {
    setLoadingState(true);
    await Future.delayed(const Duration(microseconds: 500));
    List<InstallmentApplication> data = [
      InstallmentApplication(
          name: 'Ali',
          phone: '03084248718',
          createdAt: '23-12-2023',
          status: true,
          product: 'iPhone',
          price: 200000,
          installmentsCount: 5,
          advance: '100000'),
      InstallmentApplication(
          name: 'Rehan',
          phone: '03084248718',
          createdAt: '25-12-2023',
          status: false,
          installmentsCount: 8,
          product: 'Nokia',
          price: 32000,
          advance: '2500'),
      InstallmentApplication(
          name: 'Waseem',
          phone: '03004356879',
          createdAt: '25-12-2023',
          installmentsCount: 12,
          product: 'SAMSUNG',
          price: 55000,
          advance: '1500'),
    ];
    _userApplications.value = data;
    _initUsersList = data;
    setLoadingState(false);
  }

  void onSearch(String value) {
    if (value.isEmpty) {
      _userApplications.value = _initUsersList;
      return;
    }
    final tempUsers =
        userApplications.where((user) => user.matchesSearchResult(value));
    _userApplications.value = tempUsers.toList();
  }
}
