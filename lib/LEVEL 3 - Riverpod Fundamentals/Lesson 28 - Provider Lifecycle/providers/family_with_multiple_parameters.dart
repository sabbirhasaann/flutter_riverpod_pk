import 'package:flutter_riverpod/flutter_riverpod.dart';

class Product {}

class ProductFilter {
  final String category;
  final String query;
  const ProductFilter({
    required this.category,
    required this.query,
  });
}

final filteredProductsProvider = Provider.family<List<Product>, ProductFilter>(
  (ref, filter) {
    // filtering logic
    return [];
  },
);

// usage
// ref.watch(
// filteredProductsProvider(
// const ProductFilter(
// category: 'electronics',
// query: 'phone',
// ),
// ),
// );
