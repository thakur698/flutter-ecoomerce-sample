class Product {
  final int id;
  final double price;
  final String title;
  final String description;
  final String category;
  final String image;

  Product({
    required this.category,
    required this.description,
    required this.id,
    required this.image,
    required this.price,
    required this.title,
  });

  factory Product.fromjson(Map<String, dynamic> json) {
    return Product(
      category: json['category'],
      description: json['description'],
      id: json['id'],
      image: json['image'],
      price: (json['price'] as num).toDouble(),
      title: json['title'],
    );
  }
}
