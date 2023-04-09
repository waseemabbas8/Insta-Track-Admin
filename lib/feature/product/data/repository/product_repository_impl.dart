import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/data/firebase/db/firestore_service.dart';
import '../../domain/model/product.dart';
import '../../domain/repository/product_repository.dart';
import '../model/product_api_model.dart';

class ProductRepositoryImpl extends ProductRepository {
  ProductRepositoryImpl({required this.fireStoreService});

  final FireStoreService fireStoreService;

  CollectionReference<ProductApiModel> get _productsRef => fireStoreService.getCollectionRef(
      'product', (snapshot, _) => ProductApiModel.fromMap(snapshot.data()!));

  @override
  Future<Product> createProduct({
    required String name,
    required String model,
    required int price,
  }) async {
    final obj = ProductApiModel(name: name, model: model, price: price);
    final productApiModel = await fireStoreService.add<ProductApiModel>(obj, _productsRef);
    return productApiModel.toDto();
  }

  @override
  Stream<List<Product>> getProducts() {
    return fireStoreService.observeList(_productsRef).map(
          (e) => e
              .map((e) => e.toDto())
              .toList(),
        );
  }
}
