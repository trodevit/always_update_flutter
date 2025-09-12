import 'package:always_update/assets_helper/app_colors.dart';
import 'package:always_update/assets_helper/app_fonts.dart';
import 'package:always_update/assets_helper/app_images.dart';
import 'package:flutter/material.dart';

final class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        //decoration: const BoxDecoration(color: AppColors.allPrimaryColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Image.asset(
              AppImages.appLogos,
              height: 150,
              width: 150,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'সকল ডাটা লোড হচ্ছে, অপেক্ষা করুন...',
              style: TextFontStyle.hindisiliguri10w400.copyWith(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
