import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_pk/Level%204%20-%20Mutable%20and%20Synchronous%20Riverpod%20State/Lesson%2035%20-%20State%20Model/Product%20Filter/models/sort_option_enum.dart';
import './products_provider.dart';
import '../models/product.dart';
import 'filter_provider.dart';
import '../models/category_enum.dart';

final filteredProductsProvider = Provider<List<Product>>((ref) {
  final products = ref.watch(productsProvider);
  final filter = ref.watch(filterProvider);

  final filterProducts = products.where((product) {
    final matchesCategory =
        filter.category == Category.all || product.category == filter.category;
    final matchesAvailability =
        filter.showUnavailable == true ||
        filter.showUnavailable == product.isAvailable;

    final query = filter.searchQuery.toLowerCase();
    final matchesSearch =
        query.isEmpty ||
        product.name.toLowerCase().contains(query) ||
        product.description.toLowerCase().contains(query);

    return matchesCategory && matchesAvailability && matchesSearch;
  }).toList();

  filterProducts.sort((a, b) {
    switch (filter.sort) {
      case SortOption.relevance:
        return b.popularityScore.compareTo(a.popularityScore);
      case SortOption.priceLowToHigh:
        return a.price.compareTo(b.price);
      case SortOption.priceHighToLow:
        return b.price.compareTo(a.price);
      case SortOption.newest:
        return b.createdAt.compareTo(a.createdAt);
      case SortOption.all:
        return 0;
    }
  });

  return filterProducts;
});
