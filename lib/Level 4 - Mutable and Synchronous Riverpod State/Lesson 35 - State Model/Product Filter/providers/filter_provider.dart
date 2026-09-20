import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product_filter.dart';

class FilterNotifier extends Notifier<ProductFilter> {
  @override
  ProductFilter build() {
    return const ProductFilter(
      category: Category.all,
      sort: SortOption.relevance,
      showUnavailable: false,
      searchQuery: '',
    );
  }

  void changeCategory(Category category) {
    state = state.copyWith(
      category: category,
    );
  }

  void changeSort(SortOption sort) {
    state = state.copyWith(
      sort: sort,
    );
  }
}
