import '../../../../core/data/exception.dart';
import '../../../../core/data/response.dart';
import '../../../../core/data/use_case.dart';
import '../model/product.dart';
import '../repository/product_repository.dart';

abstract class GetProductsUseCase extends ObservableUseCase<Result<List<Product>>, NoParams> {}

class GetProductsUseCaseImpl extends GetProductsUseCase {
  final ProductRepository productRepository;

  GetProductsUseCaseImpl({required this.productRepository});

  @override
  Stream<Result<List<Product>>> call({required NoParams params}) {
    return productRepository.getProducts().map(
          (products) => products.isEmpty
              ? Result.error(FirebaseException.noDataException(msg: 'No products found'),)
              : Result.success(products),
        );
  }
}
