import '../../domain/model/product.dart';
import '../../domain/repository/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  @override
  Future<Product> createProduct({required String name, required String model, required int price}) {
    // TODO: implement createProduct
    throw UnimplementedError();
  }

  @override
  Stream<List<Product>> getProducts() {
    // TODO: implement getProducts
    throw UnimplementedError();
  }
}