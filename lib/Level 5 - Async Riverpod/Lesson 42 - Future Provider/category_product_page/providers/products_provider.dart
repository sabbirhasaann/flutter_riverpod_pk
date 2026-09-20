import 'package:flutter_riverpod/flutter_riverpod.dart';
import './product_repository_provider.dart';
import '../models/product.dart';
import './category_provider.dart';

final productsProvider = FutureProvider<List<Product>>((ref) async {
  final repository = ref.watch(productRepositoryProvider);
  final category = ref.watch(categoryProvider);
  return repository.fetchProducts(category);
});
