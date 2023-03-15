import '../../domain/model/User.dart';
import '../../domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {

  @override
  Future<User?> get user async {
    // TODO: get user from firebase
    await Future.delayed(const Duration(seconds: 3));
    return User(
        id: "xas12",
        name: "Waseem"
    );
  }

  @override
  Future<User?> login({required String email, required String password}) async {
    ///TODO: call to firebase
    await Future.delayed(const Duration(seconds: 4));
    return User(
      id: "xas12",
      name: "Waseem"
    );
  }
}