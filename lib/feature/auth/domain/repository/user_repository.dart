import '../../../../core/data/repository.dart';
import '../model/User.dart';
import '../model/auth_state.dart';

abstract class UserRepository implements Repository {
  Stream<AuthState> get authSate;
  Future<User?> login({required String email, required String password});
}