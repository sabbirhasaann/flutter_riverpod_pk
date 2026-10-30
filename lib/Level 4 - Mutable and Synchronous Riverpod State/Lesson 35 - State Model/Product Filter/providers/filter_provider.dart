import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product_filter.dart';
import '../models/category_enum.dart';
import '../models/sort_option_enum.dart';

class FilterNotifier extends Notifier<ProductFilter> {
  @override
  ProductFilter build() {
    return const ProductFilter(
      category: Category.all,
      sort: SortOption.all,
      showUnavailable: true,
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

  void updateSearch(String query) {
    state = state.copyWith(searchQuery: query);
  }

  void toggleShowUnavailable() {
    state = state.copyWith(showUnavailable: !state.showUnavailable);
  }
}

final filterProvider = NotifierProvider<FilterNotifier, ProductFilter>(
  FilterNotifier.new,
);
