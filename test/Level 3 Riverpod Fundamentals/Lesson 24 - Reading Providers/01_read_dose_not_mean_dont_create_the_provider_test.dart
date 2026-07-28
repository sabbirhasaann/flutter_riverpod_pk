import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ApiClient {
  Future<List<String>> getProducts() async {
    return ['Laptop', 'Phone', 'Tablet'];
  }
}

class ProductRepository {
  final ApiClient apiClient;
  ProductRepository(this.apiClient);

  Future<List<String>> getProducts() async {
    return apiClient.getProducts();
  }
}

final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient();
});

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  final client = ref.watch(apiClientProvider);
  return ProductRepository(client);
});

void main() {
  late final ProviderContainer container;

  setUp(() {
    container = ProviderContainer();
  });

  tearDown(() {
    container.dispose();
  });

  test('read a provider', () {
    final repository = container.read(productRepositoryProvider);
    expect(repository, isA<ProductRepository>());
  });
}
