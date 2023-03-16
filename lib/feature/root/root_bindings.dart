import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../core/data/firebase/db/firestore_service.dart';
import '../../core/data/firebase/db/firestore_service_impl.dart';
import '../auth/data/repository/user_repository_impl.dart';
import '../auth/domain/repository/user_repository.dart';
import '../auth/domain/usecase/observe_auth_state.dart';
import 'root_controller.dart';

class RootBindings extends Bindings {
  @override
  void dependencies() {
    ///Global dependencies
    Get.lazyPut<FirebaseAuth>(() => FirebaseAuth.instance, fenix: true);
    Get.lazyPut<FirebaseFirestore>(() => FirebaseFirestore.instance, fenix: true);
    Get.lazyPut<FireStoreService>(() => FireStoreServiceImpl(fireStore: Get.find()), fenix: true);
    Get.lazyPut<UserRepository>(
      () => UserRepositoryImpl(firebaseAuth: Get.find(), fireStoreService: Get.find()),
      fenix: true,
    );

    Get.lazyPut<ObserveAuthStateUseCase>(() => ObserveAuthStateUseCaseImpl(repo: Get.find()));
    Get.lazyPut(() => RootController(observeAuthState: Get.find()));
  }
}
