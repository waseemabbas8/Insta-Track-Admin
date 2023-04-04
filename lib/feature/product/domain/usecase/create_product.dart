import '../../../../core/data/exception.dart';
import '../../../../core/data/response.dart';
import '../../../../core/data/use_case.dart';
import '../model/product.dart';
import '../repository/product_repository.dart';

class CreateProductParams {
  final String name;
  final String model;
  final int price;

  CreateProductParams({required this.name, required this.model, required this.price});
}

abstract class CreateProductUseCase extends UseCase<Product, CreateProductParams> {}

class CreateProductUseCaseImpl extends CreateProductUseCase {
  final ProductRepository productRepository;

  CreateProductUseCaseImpl({required this.productRepository});

  @override
  Future<Result<Product>> call({required CreateProductParams params}) async {
    try {
      final product = await productRepository.createProduct(
        name: params.name,
        model: params.model,
        price: params.price,
      );
      return Result.success(product);
    } catch (e) {
      return Result.error(FirebaseException.badRequest(msg: e.toString()));
    }
  }
}
