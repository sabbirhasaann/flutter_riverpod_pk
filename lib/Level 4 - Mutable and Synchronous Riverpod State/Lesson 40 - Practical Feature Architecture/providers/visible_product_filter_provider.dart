import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/product.dart';
import 'filtered_product_provider.dart';
import 'select_sort_provider.dart';

final visibleProductsProvider = Provider<List<Product>>((ref) {
  final products = ref.watch(filteredProductsProvider);
  final sort = ref.watch(selectedSortProvider);
  final result = [...products];
  switch (sort) {
    case SortMode.name:
      result.sort(
        (a, b) => a.name.compareTo(b.name),
      );
    case SortMode.priceAsc:
      result.sort(
        (a, b) => a.price.compareTo(b.price),
      );
    case SortMode.priceDesc:
      result.sort(
        (a, b) => b.price.compareTo(a.price),
      );
  }
  return result;
});
