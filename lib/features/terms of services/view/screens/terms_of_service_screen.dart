import 'package:ecommerce_app/features/privacy%20policy/views/widgets/info_screen.dart';
import 'package:ecommerce_app/utils/app_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermsOfServiceScreen extends StatelessWidget {
  const TermsOfServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: ()=> Get.back(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
        title: Text(
          'Terms of Service',
          style: AppTextstyles.withColor(
            AppTextstyles.h3,
            isDark ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(screenSize.width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoScreen(
                title: 'Welcome to Shopika Store', 
                content: 'By accessing and using this application, you accept and agree to abide by our terms and conditions of this agreement.',
              ),
              InfoScreen(
                title: 'Account Registration', 
                content: 'By accessing and using this application, you accept and agree to abide by our terms and conditions of this agreement.',
              ),
              InfoScreen(
                title: 'User Responsibilities', 
                content: 'By accessing and using this application, you accept and agree to abide by our terms and conditions of this agreement.',
              ),
              InfoScreen(
                title: 'Privacy Policy', 
                content: 'By accessing and using this application, you accept and agree to abide by our terms and conditions of this agreement.',
              ),
              InfoScreen(
                title: 'Intellectual Property', 
                content: 'By accessing and using this application, you accept and agree to abide by our terms and conditions of this agreement.',
              ),
              InfoScreen(
                title: 'Termination', 
                content: 'By accessing and using this application, you accept and agree to abide by our terms and conditions of this agreement.',
              ),
              const SizedBox(height: 24),
              Text(
                'Last updated on August 2025',
                style: AppTextstyles.withColor(
                  AppTextstyles.bodySmall,
                  isDark ? Colors.grey[400]! : Colors.grey[600]!,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}