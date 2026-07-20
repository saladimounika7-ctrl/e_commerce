class Product {
  // Product ID
  final int id;

  // Product Title
  final String title;

  // Product Price
  final double price;

  // Product Description
  final String description;

  // Product Category
  final String category;

  // Product Image URL
  final String image;

  // Constructor
  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  });
}