import 'package:always_update/assets_helper/app_colors.dart';
import 'package:always_update/assets_helper/app_fonts.dart';
import 'package:always_update/common_widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(title: 'টার্মস এবং কন্ডিশন'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Terms and Conditions for Always Update',
                  style: TextFontStyle.textStyle18w400Poppins.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Introduction',
                  style: TextFontStyle.textStyle18w400Poppins.copyWith(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.justify,
                ),
                Text(
                  'Welcome to Always Update! By using our app, you agree to comply with the following terms and conditions. If you do not agree, please refrain from using the app.',
                  style: TextFontStyle.textStyle18w400Poppins.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    height: 1.6,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 20),
                Text(
                  'User Responsibilities',
                  style: TextFontStyle.textStyle18w400Poppins.copyWith(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.justify,
                ),
                Text(
                  '- You agree to use the app in a lawful manner and not for any illegal activity.\n'
                  '- You shall not use the app to upload or share harmful, inappropriate, or unlawful content.\n'
                  '- You agree to follow all applicable laws while using this app.',
                  style: TextFontStyle.textStyle18w400Poppins.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    height: 1.6,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 20),
                Text(
                  'Limitation of Liability',
                  style: TextFontStyle.textStyle18w400Poppins.copyWith(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.justify,
                ),
                Text(
                  'We shall not be liable for any damages or losses arising from the use or inability to use the app. The app is provided on an "as is" basis without any warranties.',
                  style: TextFontStyle.textStyle18w400Poppins.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    height: 1.6,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 20),
                Text(
                  'Changes to Terms',
                  style: TextFontStyle.textStyle18w400Poppins.copyWith(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.justify,
                ),
                Text(
                  'We may update or modify these Terms and Conditions from time to time. Any changes will be reflected in the app and on this page.',
                  style: TextFontStyle.textStyle18w400Poppins.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    height: 1.6,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 20),
                Text(
                  'Contact Us',
                  style: TextFontStyle.textStyle18w400Poppins.copyWith(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.justify,
                ),
                Text(
                  'If you have any questions or concerns regarding these terms, feel free to contact us at:\n\n'
                  'Email: alwaysupdatemanager@gmail.com\n'
                  'Phone: +880 1743-182139\n',
                  style: TextFontStyle.textStyle18w400Poppins.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    height: 1.6,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.justify,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    '© 2025 all right reserved by Trodev IT\n',
                    style: TextFontStyle.textStyle18w400Poppins.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
