import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Product {
  final int id;
  final String name;

  Product({
    required this.id,
    required this.name,
  });
}

class ProductRepository {
  Future<List<Product>> fetchProducts() async {
    //API call
    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );
    return [
      Product(id: 1, name: 'Laptop'),
      Product(id: 2, name: 'Phone'),
    ];
  }
}

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  return ProductRepository();
});

final productsProvider = FutureProvider<List<Product>>((ref) {
  final repository = ref.watch(productRepositoryProvider);
  return repository.fetchProducts();
});
void main() {
  late final ProviderContainer container;
  setUp(() {
    container = ProviderContainer();
  });

  tearDown(() {
    container.dispose();
  });

  test('product Provider should get 2 products', () async {
    final productsState = container.read(productsProvider.future);
    print(productsState);
    expect(productsState, isA<AsyncLoading>());
    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );
    print(productsState);
    expect(productsState, isA<AsyncData>());
  });
}
