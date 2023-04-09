import 'package:get/get.dart';

import '../../../core/base_page.dart';
import '../../../core/data/response.dart';
import '../../../core/data/use_case.dart';
import '../../../core/route/app_routes.dart';
import '../../../core/route/home_navigation.dart';
import '../domain/model/app_user.dart';
import '../domain/usecase/get_users.dart';

class UsersController extends BaseController {

  UsersController({required this.getUsers});

  final GetUsersUseCase getUsers;

  final RxList<AppUser> _users = RxList();

  List<AppUser> get users => _users;

  List<AppUser> _initUsersList = List.empty();

  @override
  void onInit() {
    _fetchAppUsers();
    super.onInit();
  }

  void _fetchAppUsers() {
    setLoadingState(true);
    getUsers(params: NoParams.getInstance()).listen((result) {
      if(result is SuccessResult) {
        _users.value = (result as SuccessResult).data;
        _initUsersList = (result as SuccessResult).data;
      } else {
        _users.value = List.empty();
      }
      setLoadingState(false);
    });
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
