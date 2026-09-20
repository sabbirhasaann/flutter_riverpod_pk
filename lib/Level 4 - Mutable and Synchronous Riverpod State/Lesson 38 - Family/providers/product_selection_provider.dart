import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductSelectionNotifier extends Notifier<int> {
  ProductSelectionNotifier(this.productId);

  final int productId;
  @override
  int build() {
    print("product id: $productId");
    return 0;
  }

  void increment() {
    state = state + 1;
  }

  void decrement() {
    if (state > 0) {
      state = state - 1;
    }
  }
}

final productSelectionProvider =
    NotifierProvider.family<ProductSelectionNotifier, int, int>((productId) {
      return ProductSelectionNotifier(productId);
    });
