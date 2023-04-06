import '../../domain/model/product.dart';
import '../../domain/repository/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  @override
  Future<Product> createProduct({required String name, required String model, required int price}) {
    // TODO: implement createProduct
    throw UnimplementedError();
  }

  @override
  Stream<List<Product>> getProducts() async* {
    // TODO: fetch from firebase
    Future.delayed(const Duration(microseconds: 600));
    final List<Product> list = [
      Product(id: 'id1', name: 'iPhone', model: 'model1', price: 120000),
      Product(id: 'id2', name: 'Samsung Glaxy', model: 'Note 10', price: 100000),
      Product(id: 'id3', name: 'Oppo', model: 'F19 Pro', price: 65000),
      Product(id: 'id4', name: 'Gaming Box', model: '2017', price: 50000),
    ];
    yield list;
  }
}