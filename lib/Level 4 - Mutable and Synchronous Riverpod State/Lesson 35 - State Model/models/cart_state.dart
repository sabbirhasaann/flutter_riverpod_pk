import './cart_item.dart';

class CartState {
  final List<CartItem> items;
  final String? couponCode;
  const CartState({
    required this.items,
    this.couponCode,
  });

  CartState copyWith({
    List<CartItem>? items,
    String? couponCode,
  }) {
    return CartState(
      items: items ?? this.items,
      couponCode: couponCode ?? this.couponCode,
    );
  }
}
