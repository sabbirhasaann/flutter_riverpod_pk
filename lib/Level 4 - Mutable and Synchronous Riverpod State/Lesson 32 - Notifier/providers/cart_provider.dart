import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product.dart';

class CartNotifier extends Notifier<List<Product>> {
  @override
  List<Product> build() {
    return [];
  }

  void addProduct(Product product) {
    state = [...state, product];
  }

  void removeProduct(int productId) {
    state = state.where((product) {
      return product.id != productId;
    }).toList();
  }

  void clearCart() {
    state = [];
  }
}
