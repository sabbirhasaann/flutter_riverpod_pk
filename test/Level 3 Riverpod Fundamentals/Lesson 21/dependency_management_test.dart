import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ApiClient {
  Future<List<String>> fetchProducts() async {
    return ['Product 1', 'Product 2'];
  }
}

class ProductRepository {
  final ApiClient apiClient;

  ProductRepository(this.apiClient);

  Future<List<String>> getProducts() async {
    return await apiClient.fetchProducts();
  }
}

final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient();
});

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  print("Repository called");
  final apiClient = ref.watch(apiClientProvider);

  return ProductRepository(apiClient);
});

void main() {
  late ProviderContainer container;

  setUp(() {
    container = ProviderContainer();
  });

  tearDown(() {
    container.dispose();
  });

  test('apiClientProvider should return a ApiClient instance', () {
    final apiClient = container.read(apiClientProvider);
    expect(apiClient, isA<ApiClient>());
  });

  test(
    'providerRepositoryProvider should return a product repository instanct',
    () {
      final repositoryProvider = container.read(productRepositoryProvider);
      expect(repositoryProvider, isA<ProductRepository>());
    },
  );

  test('provider should return a list of string', () async {
    final repository = container.read(productRepositoryProvider);
    final products = await repository.getProducts();
    expect(products.length, 2);
  });
}
