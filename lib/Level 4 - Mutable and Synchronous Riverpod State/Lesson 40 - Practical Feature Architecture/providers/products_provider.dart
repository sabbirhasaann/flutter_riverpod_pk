import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product.dart';

final productsProvider = Provider<List<Product>>((ref) {
  return const [
    Product(
      id: '1',
      name: 'Laptop',
      category: 'Electronics',
      price: 1000,
      isAvailable: true,
      stock: 10,
    ),
    Product(
      id: '2',
      name: 'Phone',
      category: 'Electronics',
      price: 700,
      isAvailable: true,
      stock: 5,
    ),
    Product(
      id: '3',
      name: 'Chair',
      category: 'Furniture',
      price: 150,
      isAvailable: false,
      stock: 0,
    ),
  ];
});
