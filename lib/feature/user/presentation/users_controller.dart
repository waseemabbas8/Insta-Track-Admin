import 'package:get/get.dart';

import '../../../core/base_page.dart';
import '../../../core/route/app_routes.dart';
import '../../../core/route/home_navigation.dart';
import '../../../core/utils/constants.dart';
import '../domain/model/app_user.dart';

class UsersController extends BaseController {
  final RxList<AppUser> _users = RxList();

  List<AppUser> get users => _users;

  List<AppUser> _initUsersList = List.empty();

  @override
  void onInit() {
    _fetchAppUsers();
    super.onInit();
  }

  void _fetchAppUsers() async {
    setLoadingState(true);
    await Future.delayed(const Duration(microseconds: 500));
    List<AppUser> data = [
      AppUser(
        id: 'id',
        name: 'Waseem',
        email: 'waseem@gmail.com',
        nic: '3540321711105',
        image: 'https://picsum.photos/id/146/200',
        phone: '03021888898',
        city: 'Sangla Hill',
        address: 'Faizabad',
        createdAt: '23-12-2023',
        isActive: true
      ),
      AppUser(
        id: 'id2',
        name: 'Mubashar',
        email: 'mubashar@gmail.com',
        nic: '3540321711103',
        image: 'https://picsum.photos/200',
        phone: '03021888897',
        city: 'Sangla Hill',
        address: 'Faizabad',
        createdAt: '21-12-2023',
        isActive: false,
      ),
    ];
    _users.value = data;
    _initUsersList = data;
    setLoadingState(false);
  }

  void onSearch(String value) {
    if(value.isEmpty) {
      _users.value = _initUsersList;
      return;
    }
    final tempUsers = users.where((user) => user.matchesSearchResult(value));
    _users.value = tempUsers.toList();
  }

  void onViewUser(AppUser user) {
    Get.toNamed(AppRoutes.usersDetail, id: HomeNavigation.id, arguments: [user]);
  }

  void onUserActivation(AppUser user) {

  }
}
