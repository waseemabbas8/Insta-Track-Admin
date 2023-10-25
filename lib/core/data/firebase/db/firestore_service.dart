import 'package:cloud_firestore/cloud_firestore.dart';
import 'firestore_doc.dart';

abstract class FireStoreService {
  Future<T> add<T extends FireStoreDoc>(T obj, CollectionReference colRef);

  Future update(FireStoreDoc obj, DocumentReference docRef);

  Future updateField(Map<String, Object?> obj, DocumentReference docRef);

  Future delete(DocumentReference docRef);

  Future<T?> get<T extends FireStoreDoc>(DocumentReference<T> docRef);

  Future<List<T>> getList<T extends FireStoreDoc>(CollectionReference<T> colRef);

  Stream<List<T>> observeList<T extends FireStoreDoc>(CollectionReference<T> colRef);

  Stream<List<T>> getListStreamByQuery<T extends FireStoreDoc>(Query<T> query);

  CollectionReference<T> getCollectionRef<T extends FireStoreDoc>(
    String path,
    FromFirestore<T> fromFirestore,
  );

  DocumentReference<T> getDocumentRef<T extends FireStoreDoc>(
    String path,
    FromFirestore<T> fromFirestore,
  );

  CollectionReference<T> getSubCollectionRef<T extends FireStoreDoc>(
    String collectionPath,
    String docPath,
    String subCollection,
    FromFirestore<T> fromFirestore,
  );

  DocumentReference getCountDocumentRef<T extends FireStoreDoc>(
    String collectionPath,
    String docPath,
  );

}
