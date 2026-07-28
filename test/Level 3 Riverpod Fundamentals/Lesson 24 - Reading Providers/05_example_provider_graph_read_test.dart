import 'package:flutter_riverpod/flutter_riverpod.dart';

class ApiClient {
  void get() {}
}

class ProductRepository {
  final ApiClient apiClient;
  ProductRepository(this.apiClient);
}

final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient();
});

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  final apiClient = ref.read(apiClientProvider);
  return ProductRepository(apiClient);
});

void main() {}
