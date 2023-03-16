import 'package:firebase_auth/firebase_auth.dart' as firebase;

import '../../../../core/data/firebase/db/firestore_service.dart';
import '../../domain/model/User.dart';
import '../../domain/model/auth_state.dart';
import '../../domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final firebase.FirebaseAuth firebaseAuth;
  final FireStoreService fireStoreService;

  UserRepositoryImpl({required this.firebaseAuth, required this.fireStoreService});

  @override
  Stream<AuthState> get authSate => firebaseAuth
      .authStateChanges()
      .map((user) => user != null ? AuthState.signedIn : AuthState.signedOut);

  @override
  Future<User?> login({required String email, required String password}) async {
    final credential =
        await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    if(credential.user == null) return null;
    return User(
      id: credential.user!.uid,
      name: credential.user!.displayName.toString(),
      email: credential.user!.email!,
    );
  }
}
