import '../../../../core/data/repository.dart';
import '../model/User.dart';

abstract class UserRepository implements Repository {
  Future<User?> get user;
  Future<User?> login({required String email, required String password});
}