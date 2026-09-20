import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product.dart';
import 'product_repository_provider.dart';

final productsProvider = FutureProvider<List<Product>>((ref) async {
  final repository = ref.watch(productRepositoryProvider);
  return repository.fetchProducts();
});
