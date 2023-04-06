import 'package:get/get.dart';

import '../data/repository/product_repository_impl.dart';
import '../domain/repository/product_repository.dart';
import '../domain/usecase/create_product.dart';
import '../domain/usecase/get_products.dart';
import 'products_controller.dart';

class ProductsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductRepository>(() => ProductRepositoryImpl(fireStoreService: Get.find()));
    Get.lazyPut<GetProductsUseCase>(() => GetProductsUseCaseImpl(productRepository: Get.find()));
    Get.lazyPut<CreateProductUseCase>(() => CreateProductUseCaseImpl(productRepository: Get.find()));
    Get.lazyPut(() => ProductsController(getProducts: Get.find(), createProduct: Get.find()));
  }
}