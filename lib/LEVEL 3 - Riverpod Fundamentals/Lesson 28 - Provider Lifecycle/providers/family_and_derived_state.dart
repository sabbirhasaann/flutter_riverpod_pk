import 'package:flutter_riverpod/flutter_riverpod.dart';

class Product {
  final String category;
  Product({
    required this.category,
  });
}

final productsProvider = Provider<List<Product>>((ref) {
  return [];
});

final productsByCategoryProvider = Provider.family<List<Product>, String>((
  ref,
  category,
) {
  final products = ref.watch(productsProvider);
  return products.where((product) => product.category == category).toList();
});


// ref.watch(productsByCategoryProvider('electronics'));