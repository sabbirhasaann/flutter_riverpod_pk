import './category_enum.dart';

class Product {
  final int id;
  final String name;
  final Category category;

  Product({
    required this.id,
    required this.name,
    required this.category,
  });
}
