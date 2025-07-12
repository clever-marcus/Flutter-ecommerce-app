import 'package:flutter/material.dart';

class ProductFilterSheet extends StatefulWidget {
  const ProductFilterSheet({super.key});

  @override
  State<ProductFilterSheet> createState() => _ProductFilterSheetState();
}

class _ProductFilterSheetState extends State<ProductFilterSheet> {
  String? _selectedCategory;
  String? _selectedPrice;
  String? _selectedBrand;

  final List<String> _categories = ['Clothes', 'Shoes', 'Electronics', 'Accessories'];
  final List<String> _priceRanges = ['< \$400', '\$250–550', '> \$600'];
  final List<String> _brands = ['Nike', 'Apple', 'Samsung', 'Adidas', 'Generic'];

  void _applyFilters() {
    Navigator.pop(context, {
      'category': _selectedCategory,
      'priceRange': _selectedPrice,
      'brand': _selectedBrand,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Help Me Find Something",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            DropdownButtonFormField<String>(
              value: _selectedCategory,
              items: _categories.map((cat) => DropdownMenuItem(value: cat, child: Text(cat))).toList(),
              onChanged: (value) => setState(() => _selectedCategory = value),
              decoration: const InputDecoration(labelText: 'Category', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 12),

            DropdownButtonFormField<String>(
              value: _selectedPrice,
              items: _priceRanges.map((p) => DropdownMenuItem(value: p, child: Text(p))).toList(),
              onChanged: (value) => setState(() => _selectedPrice = value),
              decoration: const InputDecoration(labelText: 'Price Range', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 12),

            DropdownButtonFormField<String>(
              value: _selectedBrand,
              items: _brands.map((b) => DropdownMenuItem(value: b, child: Text(b))).toList(),
              onChanged: (value) => setState(() => _selectedBrand = value),
              decoration: const InputDecoration(labelText: 'Brand (Optional)', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: _applyFilters,
              child: const Text("Find Products"),
            ),
          ],
        ),
      ),
    );
  }
}
