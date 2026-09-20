import '../models/product.dart';

class ProductRepository {
  Future<List<Product>> fetchProducts() async {
    // API call
    await Future.delayed(
      const Duration(
        seconds: 3,
      ),
    );
    return [
      Product(id: 1, name: 'Laptop'),
      Product(id: 2, name: 'Phone'),
    ];
  }
}
