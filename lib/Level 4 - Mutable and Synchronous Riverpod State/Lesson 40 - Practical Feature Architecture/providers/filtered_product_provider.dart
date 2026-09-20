import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product.dart';
import './products_provider.dart';
import './search_query_provider.dart';
import './availability_filter.dart';
import './selected_category_provider.dart';

final filteredProductsProvider = Provider<List<Product>>((ref) {
  final products = ref.watch(productsProvider);
  final query = ref.watch(searchQueryProvider).toLowerCase().trim();
  final category = ref.watch(selectedCategoryProvider);
  final showUnavailable = ref.watch(showUnavailableProvider);
  return products.where((product) {
    final matchesSearch =
        query.isEmpty || product.name.toLowerCase().contains(query);
    final matchesCategory = category == 'All' || product.category == category;
    final matchesAvailability = showUnavailable || product.isAvailable;
    return matchesSearch && matchesCategory && matchesAvailability;
  }).toList();
});
