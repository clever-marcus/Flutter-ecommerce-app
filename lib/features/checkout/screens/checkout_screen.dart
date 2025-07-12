import 'package:ecommerce_app/features/checkout/widgets/address_card.dart';
import 'package:ecommerce_app/features/checkout/widgets/checkout_bottom_bar.dart';
import 'package:ecommerce_app/features/checkout/widgets/order_summary_card.dart';
import 'package:ecommerce_app/features/checkout/widgets/payment_method_card.dart';
import 'package:ecommerce_app/features/order%20confirmation/screens/order_confirmation_screen.dart';
import 'package:ecommerce_app/utils/app_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: ()=> Get.back(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
        title: Text(
          'Checkout',
          style: AppTextstyles.withColor(
            AppTextstyles.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(context, 'Shipping Address'),
            const SizedBox(height: 16),
            const AddressCard(),
            const SizedBox(height: 24),
            _buildSectionTitle(context, 'Payment Method'),
            const SizedBox(height: 16),
            const PaymentMethodCard(),
            const SizedBox(height: 24),
            _buildSectionTitle(context, 'Order Summary'),
            const SizedBox(height: 16),
            const OrderSummaryCard(),
          ],
        ),
      ),
      bottomNavigationBar: CheckoutBottomBar(
        totalAMount: 665.30,
        onPlaceOrder: () {
          // generate a random order number (in real app, this would come from backend)
          final orderNumber = 'ORD${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}';
        
          Get.to(() => OrderConfirmationScreen(
            orderNumber: orderNumber,
            totalAmount: 655.50,
          ));
        },
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: AppTextstyles.withColor(
        AppTextstyles.h3,
        Theme.of(context).textTheme.bodyLarge!.color!,
      ),
    );
  }
}