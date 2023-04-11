import '../../../../core/data/repository.dart';
import '../model/app_user.dart';
import '../model/contact.dart';

abstract class AppUserRepository extends Repository {
  Stream<List<AppUser>> getUsers();
  Future<AppUser?> getUserById(String id);
  Future<int> activateUser({required String id, required bool active});
  Future<List<Contact>> getContacts({required String userId});
}