import 'package:flutter/foundation.dart';

@immutable
class Product {
  final String id;
  final String name;
  final String category;
  final double price;
  final bool isAvailable;
  final int stock;
  const Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.isAvailable,
    required this.stock,
  });
}
