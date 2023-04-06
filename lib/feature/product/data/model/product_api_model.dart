import '../../../../core/data/firebase/db/firestore_doc.dart';
import '../../domain/model/product.dart';

class ProductApiModel extends FireStoreDoc {
  final String name;
  final String model;
  final int price;

  ProductApiModel({required this.name, required this.model, required this.price});

  factory ProductApiModel.fromMap(Map<String, dynamic> map) => ProductApiModel(
        name: map['name'] as String,
        model: map['model'] as String,
        price: map['price'] as int,
      );

  @override
  Map<String, dynamic> toMap() => <String, dynamic>{
        'name': name,
        'model': model,
        'price': price,
      };

  Product toDto() => Product(id: docId!, name: name, model: model, price: price);
}
