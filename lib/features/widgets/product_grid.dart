import 'package:ecommerce_app/models/product.dart';
import 'package:ecommerce_app/features/widgets/product_card.dart';
import 'package:ecommerce_app/features/widgets/product_details_screen.dart';
import 'package:flutter/material.dart';

class ProductGrid extends StatelessWidget {
  final String? category;
  final String? priceRange;
  final String? brand;
  
  const ProductGrid({super.key, this.category, this.priceRange, this.brand});

  @override
  Widget build(BuildContext context) {
    // Filter products based on category, brand, and price range
    final filteredProducts = products.where((product) {
      final matchesCategory = category == null || product.category == category;
      final matchesBrand = brand == null || product.brand == brand;
      final matchesPrice = priceRange == null || _checkPrice(product.price, priceRange!);
      return matchesCategory && matchesBrand && matchesPrice;
    }).toList();

    if (filteredProducts.isEmpty) {
      return const Center(child: Text('No products match your filters.'));
    }
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: filteredProducts.length,
      itemBuilder: (context, index) {
        final product = filteredProducts[index];
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProductDetailsScreen(
              product: product,
            ))
          ),
          child: ProductCard(product: product),
        );
      },
    );
  }

  bool _checkPrice(double price, String range) {
    if (range == '< \$200') return price < 200;
    if (range == '\$250–500') return price >= 250 && price <= 500;
    if (range == '> \$600') return price > 600;
    return true;
  }
}