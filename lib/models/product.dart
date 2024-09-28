class Product {
  final int id;
  final String title;
  final String description;
  final String image;
  final double price;

  // Constructor with named parameters
  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
  });

  // Factory constructor to create an instance from JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
      price: json['price'].toDouble(), // Ensure price is a double
    );
  }
}
