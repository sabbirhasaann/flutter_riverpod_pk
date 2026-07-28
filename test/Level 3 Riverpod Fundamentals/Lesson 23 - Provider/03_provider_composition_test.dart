import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ApiClient {}

class ProductRepository {
  final ApiClient apiClient;
  ProductRepository(this.apiClient);

  int cachedProduct() {
    return 10;
  }
}

final apiClientProvider = Provider<ApiClient>((r) {
  return ApiClient();
});

final productRepositoryProvider = Provider<ProductRepository>((r) {
  final client = r.watch(apiClientProvider);
  return ProductRepository(client);
});

final productCountProvider = Provider<int>((ref) {
  final repository = ref.watch(productRepositoryProvider);
  return repository.cachedProduct();
});

void main() {
  late final ProviderContainer container;

  setUp(() {
    container = ProviderContainer();
  });

  tearDown(() {
    container.dispose();
  });

  test('repository provider should provide ProdutRepository', () {
    final repository = container.read(productRepositoryProvider);
    expect(repository, isA<ProductRepository>());
  });

  test('cached product should be 10', () {
    final count = container.read(productCountProvider);
    expect(count, 10);
  });
}
