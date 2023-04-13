import 'package:cloud_firestore/cloud_firestore.dart';

class InstallmentApplication {
  final String id;
  final Product productInfo;
  final int advance;
  final int status;
  final Installment installmentCount;
  final User userInfo;
  final String productId;
  final String userId;
  final Timestamp createdAt;

  InstallmentApplication({
    required this.productInfo,
    required this.advance,
    required this.status,
    required this.installmentCount,
    required this.userInfo,
    required this.productId,
    required this.userId,
    required this.createdAt,
    required this.id,
  });
}

class User {
  final String fullName;
  final String phone;

  User(this.fullName, this.phone);
}

class Product {
  final String model;
  final String name;
  final int price;

  Product(this.model, this.name, this.price);
}

class Installment {
  final int paid;
  final int total;

  Installment(this.paid, this.total);
}
