import '../repositories/product_repository.dart';
import '../entities/product.dart';

class GetProductsUsecase {
  final ProductRepository repository;
  GetProductsUsecase({
    required this.repository,
  });

  Future<List<Product>> call() async {
    print("Called products...");
    return repository.getProducts();
  }
}
