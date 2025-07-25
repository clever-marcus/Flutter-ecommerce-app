import 'package:ecommerce_app/features/widgets/custom_textfield.dart';
import 'package:ecommerce_app/utils/app_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsetsGeometry.symmetric(horizontal: 24),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: isDark ?
                  Colors.black.withOpacity(0.2)
                  : Colors.grey.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ]
            ),
            child: const CustomTextfield(
              label: 'Full Name', 
              prefixIcon: Icons.person_outline,
              initialValue: 'Marcus Were',
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: isDark ? 
                  Colors.black.withOpacity(0.2)
                  : Colors.grey.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const CustomTextfield(
              label: 'Email', 
              prefixIcon: Icons.email_outlined,
              initialValue: 'marcusogutu430@gmail.com',
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(12),
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
            child: const CustomTextfield(
              label: 'Phone Number', 
              prefixIcon: Icons.phone_outlined,
              initialValue: '012345678',
              keyboardType: TextInputType.phone,
            ),
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Get.back();
              }, 
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Save Changes',
                style: AppTextstyles.withColor(
                  AppTextstyles.buttonMedium,
                  Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}