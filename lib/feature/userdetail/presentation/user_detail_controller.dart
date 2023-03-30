import 'package:get/get.dart';

import '../../../core/base_page.dart';
import '../../../core/route/home_navigation.dart';
import '../../user/domain/model/app_user.dart';
import '../../user/domain/model/contact.dart';

class UserDetailController extends BaseController {

  UserDetailController({required this.user});

  final AppUser user;
  final RxList<Contact> _contacts = RxList();
  List<Contact> get contacts => _contacts;

  @override
  void onInit() {
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
}