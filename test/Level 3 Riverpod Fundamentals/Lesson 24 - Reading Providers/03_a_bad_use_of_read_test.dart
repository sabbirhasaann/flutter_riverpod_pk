import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Product {
  final String category;
  final double price;
  Product({required this.category, required this.price});
}

final productsProvider = Provider<List<Product>>((ref) {
  return [
    Product(
      category: "mobile",
      price: 100,
    ),
    Product(
      category: "laptop",
      price: 200,
    ),
  ];
});

final selectedCategoryProvider = Provider<String>((ref) {
  return "laptop";
});

final filteredProductsProvider = Provider<List<Product>>((ref) {
  final products = ref.read(productsProvider);
  final category = ref.read(selectedCategoryProvider);
  return products.where((p) => p.category == category).toList();
});

void main() {
  late final ProviderContainer container;

  setUp(() {
    container = ProviderContainer();
  });

  tearDown(() {
    container.dispose();
  });

  test('laptop category filter products length 1', () {
    final filterProducts = container.read(filteredProductsProvider);
    print(filterProducts.length);
    print(filterProducts);
    print(filterProducts[0].price);
    expect(filterProducts.length, 1);
  });
}
