import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/data/firebase/db/firestore_service.dart';
import '../../domain/model/app_user.dart';
import '../../domain/model/contact.dart';
import '../../domain/repository/app_user_repository.dart';
import '../model/contacts_response.dart';
import '../model/user_api_model.dart';

class AppUserRepositoryImpl extends AppUserRepository {
  AppUserRepositoryImpl({required this.fireStoreService});

  final FireStoreService fireStoreService;

  @override
  Future<AppUser?> getUserById(String id) async {
    final docRef = fireStoreService.getDocumentRef(
      'user/$id',
      (snapshot, options) => UserApiModel.fromMap(snapshot.data()!),
    );
    return (await fireStoreService.get(docRef))?.toDto();
  }

  @override
  Stream<List<AppUser>> getUsers() {
    CollectionReference<UserApiModel> usersRef = fireStoreService.getCollectionRef(
        'user', (snapshot, _) => UserApiModel.fromMap(snapshot.data()!));
    return fireStoreService.observeList(usersRef).map(
          (event) => event.map((e) => e.toDto()).toList(),
        );
  }

  @override
  Future<int> activateUser({required String id, required bool active}) async {
    final docRef = fireStoreService.getDocumentRef(
      'user/$id',
          (snapshot, options) => UserApiModel.fromMap(snapshot.data()!),
    );
    final obj = {
      'active': active
    };
    await fireStoreService.updateField(obj, docRef);
    return 1;
  }

  @override
  Future<List<Contact>> getContacts({required String userId}) async {
    final docRef = fireStoreService.getDocumentRef(
      'contacts/$userId',
          (snapshot, options) => ContactsResponse.fromMap(snapshot.data()!),
    );
    final response = await fireStoreService.get(docRef);
    return response?.contacts.map((e) => e.toDto()).toList() ?? List.empty();
  }

}
