import '../../../../core/data/repository.dart';
import '../model/app_user.dart';

abstract class AppUserRepository extends Repository {
  Stream<List<AppUser>> getUsers();
  Future<AppUser?> getUserById(String id);
}