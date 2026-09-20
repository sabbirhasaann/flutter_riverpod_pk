import 'package:flutter_riverpod/legacy.dart';

enum SortMode {
  name,
  priceAsc,
  priceDesc,
}

final selectedSortProvider = StateProvider<SortMode>((ref) {
  return SortMode.name;
});
