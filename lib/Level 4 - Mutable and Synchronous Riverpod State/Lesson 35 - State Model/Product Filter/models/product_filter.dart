enum Category {
  all,
}

enum SortOption {
  all,
  relevance,
}

class ProductFilter {
  final Category category;
  final SortOption sort;
  final bool showUnavailable;
  final String searchQuery;
  const ProductFilter({
    required this.category,
    required this.sort,
    required this.showUnavailable,
    required this.searchQuery,
  });

  ProductFilter copyWith({
    Category? category,
    SortOption? sort,
    bool? showUnavailable,
    String? searchQuery,
  }) {
    return ProductFilter(
      category: category ?? this.category,
      sort: sort ?? this.sort,
      showUnavailable: showUnavailable ?? this.showUnavailable,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}
