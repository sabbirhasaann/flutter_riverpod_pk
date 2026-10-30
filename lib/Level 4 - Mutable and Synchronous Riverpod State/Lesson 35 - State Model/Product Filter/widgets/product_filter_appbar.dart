import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/category_enum.dart';
import '../models/sort_option_enum.dart';
import '../providers/filter_provider.dart';

class ProductFilterAppBar extends ConsumerStatefulWidget
    implements PreferredSizeWidget {
  const ProductFilterAppBar({Key? key}) : super(key: key);

  @override
  ConsumerState<ProductFilterAppBar> createState() {
    return _ProductFilterAppBarState();
  }

  @override
  Size get preferredSize => const Size.fromHeight(115);
}

class _ProductFilterAppBarState extends ConsumerState<ProductFilterAppBar> {
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    final filter = ref.watch(filterProvider);
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 2,
      titleSpacing: 16,
      title: isSearching
          ? TextField(
              autofocus: true,
              decoration: const InputDecoration(
                hintText: 'Search products...',
                border: InputBorder.none,
              ),
              onChanged: (value) {
                ref.read(filterProvider.notifier).updateSearch(value);
              },
            )
          : const Text(
              'Products',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
      actions: [
        // 1. Search Toggle Button
        IconButton(
          icon: Icon(
            isSearching ? Icons.close : Icons.search,
          ),
          onPressed: () {
            if (!isSearching) {
              setState(() {
                isSearching = true;
              });
            } else {
              setState(() {
                isSearching = false;
                ref.read(filterProvider.notifier).updateSearch('');
              });
            }
          },
        ),

        // 2. Sort Menu Button
        PopupMenuButton<SortOption>(
          icon: const Icon(Icons.sort_rounded),
          tooltip: 'Sort Products',
          initialValue: filter.sort,
          onSelected: (SortOption selectedSort) {
            ref.read(filterProvider.notifier).changeSort(selectedSort);
          },
          itemBuilder: (context) => SortOption.values.map((sort) {
            return PopupMenuItem<SortOption>(
              value: sort,
              child: Row(
                children: [
                  Icon(
                    _getSortIcon(sort),
                    size: 18,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    _formatSortName(sort),
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: null,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),

        // 3. Toggle Show/Hide Unavailable Items
        IconButton(
          tooltip: 'Show Unavailable',
          icon: Icon(
            filter.showUnavailable
                ? Icons.visibility
                : Icons.visibility_off_outlined,
            color: Colors.grey,
          ),
          onPressed: () {
            ref.read(filterProvider.notifier).toggleShowUnavailable();
          },
        ),
        const SizedBox(width: 8),
      ],

      // 4. Horizontal Scrollable Category Filter Chips
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(48),
        child: Container(
          height: 48,
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: Category.values.length,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              final category = Category.values[index];

              return FilterChip(
                label: Text(
                  _formatCategoryName(category),
                ),
                // selected: isSelected,
                showCheckmark: true,
                labelStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: filter.category == category
                      ? FontWeight.bold
                      : FontWeight.normal,
                  color: Colors.black,
                ),
                selectedColor: Theme.of(context).colorScheme.primary,
                backgroundColor: Theme.of(
                  context,
                ).colorScheme.surfaceVariant.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                onSelected: (value) {
                  ref
                      .read(filterProvider.notifier)
                      .changeCategory(
                        category,
                      );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  // --- Helper Methods ---

  String _formatCategoryName(Category category) {
    final name = category.name;
    return name[0].toUpperCase() + name.substring(1);
  }

  String _formatSortName(SortOption sort) {
    switch (sort) {
      case SortOption.all:
        return 'Default Order';
      case SortOption.relevance:
        return 'Relevance';
      case SortOption.priceLowToHigh:
        return 'Price: Low to High';
      case SortOption.priceHighToLow:
        return 'Price: High to Low';
      case SortOption.newest:
        return 'Newest Arrivals';
    }
  }

  IconData _getSortIcon(SortOption sort) {
    switch (sort) {
      case SortOption.priceLowToHigh:
        return Icons.arrow_upward_rounded;
      case SortOption.priceHighToLow:
        return Icons.arrow_downward_rounded;
      case SortOption.newest:
        return Icons.new_releases_outlined;
      case SortOption.relevance:
        return Icons.star_outline_rounded;
      case SortOption.all:
        return Icons.sort_outlined;
    }
  }
}
