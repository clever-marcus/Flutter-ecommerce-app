import 'package:ecommerce_app/utils/app_textstyles.dart';
import 'package:ecommerce_app/features/widgets/category_chips.dart';
import 'package:ecommerce_app/features/widgets/product_grid.dart';
import 'package:flutter/material.dart';

import 'filter_bottom_sheet.dart';

class ShoppingScreen extends StatelessWidget {
  const ShoppingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Shopping',
          style: AppTextstyles.withColor(AppTextstyles.h3,
          isDark ? Colors.white : Colors.black,
          ),
        ),
         actions: [
          // search icon
          IconButton(
            onPressed: () {}, 
            icon: Icon(
              Icons.search,
              color: isDark ? Colors.white : Colors.black,
              ),
          ),

          // filter icon
          IconButton(
            onPressed: () => FilterBottomSheet.show(context), 
            icon: Icon(
              Icons.filter_list,
              color: isDark ? Colors.white : Colors.black,
              ),
          )
        ],
      ),
      body: const Column(
        children: [
          Padding(
            padding: EdgeInsetsGeometry.only(top: 16),
            child: CategoryChips(),
          ),
          Expanded(
            child: ProductGrid(),
          ),
        ],
      ),
    );
  }
}