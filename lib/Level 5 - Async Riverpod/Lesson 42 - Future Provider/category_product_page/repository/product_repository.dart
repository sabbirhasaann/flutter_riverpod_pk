import '../models/product.dart';
import '../models/category_enum.dart';

class ProductRepository {
  Future<List<Product>> fetchProducts(Category category) async {
    await Future.delayed(
      const Duration(
        seconds: 3,
      ),
    );
    final products = [
      Product(
        id: 1,
        name: 'Mango',
        category: Category.fruit,
      ),
      Product(
        id: 2,
        name: 'Labeo Rohita',
        category: Category.fish,
      ),
      Product(
        id: 3,
        name: 'Banana',
        category: Category.fruit,
      ),
    ];

    if (category == Category.all) {
      return products;
    }

    return products.where((product) {
      return product.category == category;
    }).toList();
  }
}
