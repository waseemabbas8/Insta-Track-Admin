import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intatrack/feature/installment/domain/model/installment_application.dart';
import '../../../../core/data/firebase/db/firestore_doc.dart';
import 'installment_count.dart';
import 'product_info.dart';
import 'user_info.dart';

class InstallmentApplicationApiModel extends TimeStampedFireStoreDoc {
  final ProductInfo productInfo;
  final int advance;
  final int status;
  final InstallmentCount installmentCount;
  final UserInfo userInfo;
  final String productId;
  final String userId;
  @override
  Timestamp createdAt;

  InstallmentApplicationApiModel({
    required this.productInfo,
    required this.advance,
    required this.status,
    required this.installmentCount,
    required this.userInfo,
    required this.productId,
    required this.userId,
    required this.createdAt,
  });

  @override
  Map<String, dynamic> toMap() => <String, dynamic>{
        'product_info': productInfo,
        'advance': advance,
        'status': status,
        'instalment_count': installmentCount,
        'user_info': userInfo,
        'product_id': productId,
        'user_id': userId,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };

  factory InstallmentApplicationApiModel.fromMap(Map<String, dynamic> map) =>
      InstallmentApplicationApiModel(
        productInfo:
            ProductInfo.fromMap(map['product_info'] as Map<String, dynamic>),
        advance: map['advance'] as int,
        status: map['status'] as int,
        installmentCount: InstallmentCount.fromMap(
            map['instalment_count'] as Map<String, dynamic>),
        userInfo: UserInfo.fromMap(map['user_info'] as Map<String, dynamic>),
        productId: map['product_id'] as String,
        userId: map['user_id'] as String,
        createdAt: map['created_at'] as Timestamp,
      );

  InstallmentApplication toDto() => InstallmentApplication(
        id: docId!,
        productInfo:
            Product(productInfo.name, productInfo.model, productInfo.price),
        advance: advance,
        status: status,
        installmentCount:
            Installment(installmentCount.paid, installmentCount.total),
        userInfo: User(userInfo.fullName, userInfo.phone),
        productId: productId,
        userId: userId,
        createdAt: createdAt,
      );
}
