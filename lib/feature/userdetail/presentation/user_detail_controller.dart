import 'package:get/get.dart';

import '../../../core/base_page.dart';
import '../../../core/data/response.dart';
import '../../../core/route/home_navigation.dart';
import '../../user/domain/model/app_user.dart';
import '../../user/domain/model/contact.dart';
import '../../user/domain/usecase/activate_user.dart';

class UserDetailController extends BaseController {
  UserDetailController({required this.userObj, required this.activateUser});

  final ActivateUserUseCase activateUser;

  final AppUser userObj;

  late Rx<AppUser> _user;

  AppUser get user => _user.value;

  final RxList<Contact> _contacts = RxList();

  List<Contact> get contacts => _contacts;

  final RxBool _activatingUser = RxBool(false);
  bool get activatingUser => _activatingUser.value;

  @override
  void onInit() {
    _user = Rx(userObj);

    _fetchContacts();
    super.onInit();
  }

  @override
  void onBack() {
    Get.back(id: HomeNavigation.id);
  }

  void _fetchContacts() {
    final List<Contact> list = [
      Contact(name: 'Nabeel Abid', phone: '03021234567'),
      Contact(name: 'Ali Rehan', phone: '03025678432'),
      Contact(name: 'Anas Hashmi', phone: '0338322345'),
      Contact(name: 'Abdullah Tahir', phone: '0312567896'),
    ];
    _contacts.value = list;
  }

  void onUserActivation() async {
    _activatingUser.value = true;
    final result = await activateUser(
      params: ActivateUserParams(userId: user.id, active: !user.isActive),
    );
    if (result is SuccessResult) {
      final newUser = AppUser(
        id: user.id,
        name: user.name,
        email: user.email,
        nic: user.nic,
        phone: user.phone,
        city: user.city,
        address: user.address,
        createdAt: user.createdAt,
        isActive: !user.isActive,
      );
      _user.value = newUser;
    } else {
      showMessage(message: (result as Error).toString());
    }
    _activatingUser.value = false;
  }
}
