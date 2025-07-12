import 'package:ecommerce_app/controllers/theme_controller.dart';
import 'package:ecommerce_app/features/view/notifications_screen.dart';
import 'package:ecommerce_app/features/widgets/product_filter_sheet.dart';
import 'package:ecommerce_app/features/widgets/all_products_screen.dart';
import 'package:ecommerce_app/features/widgets/cart_screen.dart';
import 'package:ecommerce_app/features/widgets/category_chips.dart';
import 'package:ecommerce_app/features/widgets/custom_search_bar.dart';
import 'package:ecommerce_app/features/widgets/product_grid.dart';
import 'package:ecommerce_app/features/widgets/sale_banner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _category;
  String? _priceRange;
  String? _brand;

  void _showAiChatSheet(BuildContext context) async {
    final result = await showModalBottomSheet<Map<String, String?>>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => const ProductFilterSheet(),
    );

    if (result != null) {
      setState(() {
        _category = result['category'];
        _priceRange = result['priceRange'];
        _brand = result['brand'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Floating button to launch the smart filter assistant
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAiChatSheet(context),
        child: const Icon(Icons.chat),
      ),

      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Header section
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/images/avatar.jpg'),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Hello Marcus',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'Good Afternoon',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => Get.to(() => NotificationsScreen()),
                    icon: const Icon(Icons.notifications_outlined),
                  ),
                  IconButton(
                    onPressed: () => Get.to(() => const CartScreen()),
                    icon: const Icon(Icons.shopping_bag_outlined),
                  ),
                  GetBuilder<ThemeController>(
                    builder: (controller) => IconButton(
                      onPressed: () => controller.toggleTheme(),
                      icon: Icon(
                        controller.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Search bar
            const CustomSearchBar(),

            // Category chips
            const CategoryChips(),

            // Sale banner
            const SaleBanner(),

            // Optional filter summary
            if (_category != null || _priceRange != null || _brand != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Text(
                  "Showing ${_category ?? 'all'} products"
                  "${_priceRange != null ? " in $_priceRange" : ""}"
                  "${_brand != null ? " by $_brand" : ""}.",
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ),

            // Popular Product section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Popular Product',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.to(() => const AllProductsScreen()),
                    child: Text(
                      'See All',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Product grid with filters applied
            Expanded(
              child: ProductGrid(
                category: _category,
                priceRange: _priceRange,
                brand: _brand,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
