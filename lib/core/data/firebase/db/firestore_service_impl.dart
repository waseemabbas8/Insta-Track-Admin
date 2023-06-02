import 'package:cloud_firestore/cloud_firestore.dart';

import 'firestore_doc.dart';
import 'firestore_fields.dart';
import 'firestore_service.dart';

class FireStoreServiceImpl implements FireStoreService {
  final FirebaseFirestore fireStore;

  FireStoreServiceImpl({required this.fireStore});

  @override
  Future<T> add<T extends FireStoreDoc> (T obj, CollectionReference colRef) async {
    final result = await colRef.add(obj);
    obj.docId = result.id;
    return obj;
  }

  @override
  Future update(FireStoreDoc obj, DocumentReference docRef) => docRef.update(obj.toMap());

  @override
  Future updateField(Map<String, Object?> obj, DocumentReference docRef) => docRef.update(obj);

  @override
  Future delete(DocumentReference docRef) => docRef.delete();

  @override
  Future<T?> get<T extends FireStoreDoc>(DocumentReference<T> docRef) async {
    final documentSnapshot = await docRef.get();
    if (documentSnapshot.exists) {
      return documentSnapshot.toPojo();
    } else {
      return null;
    }
  }

  @override
  Future<List<T>> getList<T extends FireStoreDoc>(CollectionReference<T> colRef) async {
    final data = await colRef.get().then((value) => value.docs);
    return data.map((e) => e.toPojo()).toList();
  }

  @override
  Stream<List<T>> observeList<T extends FireStoreDoc>(CollectionReference<T> colRef) {
    return colRef.snapshots().map((event) => event.docs.map((e) => e.toPojo()).toList());
  }

  @override
  Stream<List<T>> getListStreamByQuery<T extends FireStoreDoc>(Query<T> query) {
    return query.snapshots().asyncMap((event) => event.docs.map((e) => e.toPojo()).toList());
  }

  @override
  CollectionReference<T> getCollectionRef<T extends FireStoreDoc>(
    String path,
    FromFirestore<T> fromFirestore,
  ) =>
      fireStore.collection(path).withConverter<T>(
            fromFirestore: fromFirestore,
            toFirestore: (item, _) => item.toMap(),
          );

  @override
  DocumentReference<T> getDocumentRef<T extends FireStoreDoc>(
    String path,
    FromFirestore<T> fromFirestore,
  ) =>
      fireStore.doc(path).withConverter<T>(
            fromFirestore: fromFirestore,
            toFirestore: (item, _) => item.toMap(),
          );

  @override
  CollectionReference<T> getSubCollectionRef<T extends FireStoreDoc>(
    String collectionPath,
    String docPath,
    String subCollection,
    FromFirestore<T> fromFirestore,
  ) =>
      fireStore.collection(collectionPath).doc(docPath).collection(subCollection).withConverter<T>(
            fromFirestore: fromFirestore,
            toFirestore: (item, _) => item.toMap(),
          );

  @override
  DocumentReference getCountDocumentRef<T extends FireStoreDoc>(
    String collectionPath,
    String docPath,
  ) =>
      fireStore.collection(collectionPath).doc(docPath);
}

///extensions
extension _DocumentParser<T extends FireStoreDoc> on DocumentSnapshot<T> {
  T? toPojo() {
    final document = data();
    //document?.updatedAt = get(FireStoreFields.updatedAt);
    document?.docId = id;
    return document;
  }
}

extension _QueryDocumentParser<T extends FireStoreDoc> on QueryDocumentSnapshot<T> {
  T toPojo() {
    final document = data();
    //document.updatedAt = get(FireStoreFields.updatedAt);
    document.docId = id;
    return document;
  }
}
