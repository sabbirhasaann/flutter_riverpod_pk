import './product.dart';

class CartState {
  final List<Product> items;
  final String coupon;

  const CartState({
    required this.items,
    required this.coupon,
  });
}
