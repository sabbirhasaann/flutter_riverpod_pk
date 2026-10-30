import './category_enum.dart';

class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final double rating;
  final int popularityScore; // Higher score = more relevant/popular
  final DateTime createdAt; // For 'newest' sorting
  final Category category;
  final bool isAvailable;
  final String imageUrl;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.rating,
    required this.popularityScore,
    required this.createdAt,
    required this.category,
    required this.isAvailable,
    required this.imageUrl,
  });
}
