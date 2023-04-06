import 'package:cloud_firestore/cloud_firestore.dart';

abstract class FireStoreDoc {
  String? docId;

  Map<String, dynamic> toMap();
}

abstract class TimeStampedFireStoreDoc extends FireStoreDoc {
  abstract final Timestamp createdAt;
  Timestamp? updatedAt;
}
