import 'package:get/get.dart';
import 'dart:html' as html;

import '../../../core/base_page.dart';
import '../../../core/data/response.dart';
import '../../../core/route/home_navigation.dart';
import '../../location/domain/mdoel/geo_location.dart';
import '../../location/domain/usecase/get_user_location.dart';
import '../../user/domain/model/app_user.dart';
import '../../user/domain/model/contact.dart';
import '../../user/domain/usecase/activate_user.dart';
import '../../user/domain/usecase/get_contacts.dart';

class UserDetailController extends BaseController {
  UserDetailController({
    required this.userObj,
    required this.activateUser,
    required this.getUserLocation,
    required this.getContacts,
  });

  final ActivateUserUseCase activateUser;
  final GetUserLocationUseCase getUserLocation;
  final GetContactsUseCase getContacts;

  final AppUser userObj;

  GeoLocation? _userLocation;

  late Rx<AppUser> _user;

  AppUser get user => _user.value;

  final RxList<Contact> _contacts = RxList();

  List<Contact> get contacts => _contacts;

  final RxBool _activatingUser = RxBool(false);

  bool get activatingUser => _activatingUser.value;

  @override
  void onInit() {
    _user = Rx(userObj);
    _getLocation();

    _fetchContacts();
    super.onInit();
  }

  @override
  void onBack() {
    Get.back(id: HomeNavigation.id);
  }

  void _getLocation() async {
    final result = await getUserLocation(
      params: GetUserLocationParams(userObj.id),
    );
    if (result is SuccessResult) {
      _userLocation = (result as SuccessResult).data;
    }
  }

  void _fetchContacts() async {
    final result = await getContacts(params: GetContactsParams(userObj.id));
    if(result is SuccessResult) {
      _contacts.value = (result as SuccessResult).data;
    }
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

  void onCurrentLocation() {
    if (_userLocation == null) {
      showMessage(message: 'No location found');
      return;
    }
    html.window.open(
      'https://www.google.com/maps/search/?api=1&query=${_userLocation!.latitude},${_userLocation!.longitude}',
      "_blank",
    );
  }
}
