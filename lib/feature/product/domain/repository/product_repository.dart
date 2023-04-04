import '../../../../core/data/repository.dart';
import '../model/product.dart';

abstract class ProductRepository extends Repository {
  Future<Product> createProduct({required String name, required String model, required int price});
  Stream<List<Product>> getProducts();
}