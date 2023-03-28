import '../../../../core/data/repository.dart';
import '../model/app_user.dart';

abstract class AppUserRepository extends Repository {
  Future<List<AppUser>> getUsers();
}