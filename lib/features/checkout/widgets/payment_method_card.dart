import 'package:ecommerce_app/utils/app_textstyles.dart';
import 'package:flutter/material.dart';

class PaymentMethodCard extends StatelessWidget {
  const PaymentMethodCard({super.key});

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
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset(
                  'assets/images/mastercard.png',
                  height: 24,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Visa ending in 30 hrs 50 mins',
                      style: AppTextstyles.withColor(
                        AppTextstyles.bodyLarge,
                        Theme.of(context).textTheme.bodyLarge!.color!,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Expires 12/24',
                      style: AppTextstyles.withColor(
                        AppTextstyles.bodySmall,
                        isDark ? Colors.grey[400]! : Colors.grey[600]!,
                      ),
                    ),
                  ],
                )
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.edit_outlined,
                  color: Theme.of(context).primaryColor,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}