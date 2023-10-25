import 'package:cloud_firestore/cloud_firestore.dart';

class PaidInstallmentApiModel {
  final String applicationId;
  final int id;
  final Timestamp paidAt;

  PaidInstallmentApiModel(
      {required this.applicationId, required this.id, required this.paidAt});

  factory PaidInstallmentApiModel.fromMap(Map<String, dynamic> map) =>
      PaidInstallmentApiModel(
        applicationId: map['application_id'] as String,
        id: map['id'] as int,
        paidAt: map['paid_at'] as Timestamp,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'application_id': applicationId,
        'id': id,
        'paid_at': paidAt,
      };
}
