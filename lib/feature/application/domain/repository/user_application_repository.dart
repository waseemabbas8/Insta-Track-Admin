
import '../../../../core/data/repository.dart';
import '../model/user_application.dart';

abstract class UserApplicationRepository extends Repository {
  Future<List<UserApplication>> getUsers();
}