import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product.dart';

final productsProvider = Provider<List<Product>>((ref) {
  return const [
    Product(id: 42, name: 'Laptop', price: 1000),
    Product(id: 43, name: 'Phone', price: 700),
    Product(id: 44, name: 'Tablet', price: 500),
  ];
});
