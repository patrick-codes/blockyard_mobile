class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final int stock;
  final String image;
  final String? category;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
    required this.image,
    this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["_id"],
      name: json["name"] ?? "",
      description: json["description"] ?? "",
      price: (json["price"] ?? 0).toDouble(),
      stock: json["stock"] ?? 0,
      image: json["image"] ?? "",
      category: json["category"],
    );
  }
}
