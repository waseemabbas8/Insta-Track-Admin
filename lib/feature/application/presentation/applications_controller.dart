import 'package:get/get.dart';
import '../../../core/base_page.dart';
import '../../../core/route/app_routes.dart';
import '../../../core/route/home_navigation.dart';
import '../domain/model/user_application.dart';

class ApplicationsController extends BaseController {
  final RxList<UserApplication> _userApplications = RxList();

  List<UserApplication> get userApplications => _userApplications;

  List<UserApplication> _initUsersList = List.empty();

  @override
  void onInit() {
    _fetchAppUsers();
    super.onInit();
  }

  void _fetchAppUsers() async {
    setLoadingState(true);
    await Future.delayed(const Duration(microseconds: 500));
    List<UserApplication> data = [
      UserApplication(
          id: 'id',
          name: 'Ali',
          email: 'ali@gmail.com',
          phone: '03084248718',
          createdAt: '23-12-2023',
          status: true,
          product: 'iPhone',
          installments: 5,
          advanceAmount: '100000'),
      UserApplication(
          id: 'id2',
          name: 'Rehan',
          email: 'rehan@gmail.com',
          phone: '03084248718',
          createdAt: '25-12-2023',
          status: false,
          installments: 8,
          product: 'Nokia',
          advanceAmount: '2500'),
      UserApplication(
          id: 'id3',
          name: 'Waseem',
          email: 'waseem@gmail.com',
          phone: '03004356879',
          createdAt: '25-12-2023',
          installments: 12,
          product: 'SAMSUNG',
          advanceAmount: '1500'),
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
