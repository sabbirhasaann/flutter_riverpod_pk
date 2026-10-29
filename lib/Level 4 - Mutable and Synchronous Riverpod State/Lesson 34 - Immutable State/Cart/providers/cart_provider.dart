import '../models/cart_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product.dart';

class CartNotifier extends Notifier<CartState> {
  @override
  CartState build() {
    return CartState(
      items: [],
      coupon: 'Cupon nai...',
    );
  }

  void addProduct(Product product) {
    state = CartState(
      items: [...state.items, product],
      coupon: state.coupon,
    );
  }

  void removeProduct(int id) {
    state = CartState(
      items: state.items.where((product) {
        return product.id != id;
      }).toList(),
      coupon: state.coupon,
    );
  }
}

final cartNotifierProvider = NotifierProvider<CartNotifier, CartState>(
  CartNotifier.new,
);

final productCountProvider = Provider<int>((ref) {
  final cart = ref.watch(cartNotifierProvider);
  return cart.items.length;
});
