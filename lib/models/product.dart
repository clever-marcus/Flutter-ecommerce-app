class Product {
  final String name;
  final String brand;
  final String category;
  final double price;
  final double? oldPrice;
  final String imageUrl;
  final bool isFavorite;
  final String description;

  const Product({
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.name,
    required this.brand,
    required this.price,
    this.oldPrice,
    this.isFavorite = false,
  });
}

final List<Product> products = [
  const Product(
    name: 'Shoes',
    brand: 'Nike',
    category: 'Footwear',
    price: 69.00,
    oldPrice: 189.00,
    imageUrl: 'assets/images/shoe.jpg',
    description: 'This is a description of product 1'
  ),
  const Product(
    name: 'Laptop',
    brand: 'Apple',
    category: 'Electronics',
    price: 240.00,
    oldPrice: 300.00,
    imageUrl: 'assets/images/laptop.jpg',
    description: 'This is a description of product 2'
  ),
  const Product(
    name: 'Jordan Shoes',
    brand: 'Air Max',
    category: 'Footwear',
    price: 59.00,
    oldPrice: 79.00,
    isFavorite: true,
    imageUrl: 'assets/images/shoe2.jpg',
    description: 'This is a description of product 3'
  ),
  const Product(
    name: 'Puma',
    brand: 'Puma',
    category: 'Footwear',
    price: 119.00,
    oldPrice: 129.00,
    isFavorite: true,
    imageUrl: 'assets/images/shoes2.jpg',
    description: 'This is a description of product 4'
  ),
];
