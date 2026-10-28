class Product {
  int id;
  String name;
  String? description;
  double price;
  int stockQuantity;
  DateTime createdAt;
  DateTime updatedAt;

  Product({
    required this.id,
    required this.name,
    this.description,
    required this.price,
    required this.stockQuantity,
    required this.createdAt,
    required this.updatedAt,
  });
}
