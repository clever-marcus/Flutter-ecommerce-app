import 'package:ecommerce_app/utils/app_textstyles.dart';
import 'package:flutter/material.dart';

class OrderSummaryCard extends StatelessWidget {
  const OrderSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: isDark
            ? Colors.black.withOpacity(0.2)
            : Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Column(
        children: [
          _buildSummaryRow(
            context,
            'Subtotal',
            '\$569.99',
          ),
          const SizedBox(height: 8),
          _buildSummaryRow(context, 'Shipping', '\$5.50'),
          const SizedBox(height: 8),
          _buildSummaryRow(context, 'Tax', '\$15.50'),
          const Padding(
            padding: EdgeInsetsGeometry.symmetric(vertical: 12),
            child: Divider(),
          ),
          _buildSummaryRow(context, 'Total', '\$655.50', isTotal: true),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(BuildContext context, String label, String value, {bool isTotal = false}) {
    final TextStyle = isTotal ? AppTextstyles.h3 : AppTextstyles.bodyLarge;
    final color = isTotal ?
    Theme.of(context).primaryColor : 
    Theme.of(context).textTheme.bodyLarge!.color!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextstyles.withColor(TextStyle, color),
        ),
        Text(
          value,
          style: AppTextstyles.withColor(TextStyle, color),
        ),
      ],
    );
  }
}