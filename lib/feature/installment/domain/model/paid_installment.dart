import 'package:cloud_firestore/cloud_firestore.dart';

class PaidInstallment{
  final String applicationId;
  final int id;
  final Timestamp paidAt;

  PaidInstallment({required this.applicationId, required this.id, required this.paidAt});
}