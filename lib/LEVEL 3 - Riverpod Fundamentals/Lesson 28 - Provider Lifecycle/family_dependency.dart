import 'package:flutter_riverpod/flutter_riverpod.dart';

class ApiClient {
  Product fetchProduct(int productId) {
    return Product(
      id: productId,
      name: "Product $productId",
    );
  }
}

class Product {
  final int id;
  final String name;
  Product({
    required this.id,
    required this.name,
  });
}

final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient();
});

final productProvider = Provider.family<Product, int>((ref, productId) {
  final apiClient = ref.watch(apiClientProvider);
  return apiClient.fetchProduct(productId);
});
