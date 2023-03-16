import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FireStoreDoc {
  abstract final Timestamp createdAt;
  String? docId;

  Timestamp? updatedAt;

  Map<String, dynamic> toMap();
}
