import 'package:always_update/assets_helper/app_fonts.dart';
import 'package:always_update/common_widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'প্রাইভেসি পলিসি'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Privacy Policy for Always Update',
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
                  'At Always Update, we prioritize the privacy and security of our users.'
                  'This privacy policy outlines how we handle your data and ensures that no personal data is collected from you when using the app.',
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
                  'User Experience',
                  style: TextFontStyle.textStyle18w400Poppins.copyWith(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.justify,
                ),
                Text(
                  '- We do not collect any personal data** from our users.\n'
                  '- The app is designed to be used without requiring any input or data submission from the user.\n'
                  '- The app does not access your personal information, contacts, location, or any other sensitive data.\n'
                  '- No tracking or logging of user activity is performed in the app.',
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
                  'Third-Party Services',
                  style: TextFontStyle.textStyle18w400Poppins.copyWith(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.justify,
                ),
                Text(
                  '- The app does not integrate with third-party services that collect or track user data.\n'
                  '- There are no ads, analytics, or external data gathering technologies used in the app ',
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
                  'Data Security',
                  style: TextFontStyle.textStyle18w400Poppins.copyWith(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.justify,
                ),
                Text(
                  'Since we do not collect any personal data, there are no privacy risks related to unauthorized access to your data.',
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
                  'Changes to the Privacy Policy',
                  style: TextFontStyle.textStyle18w400Poppins.copyWith(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.justify,
                ),
                Text(
                  'We may update this policy from time to time. Any changes will be reflected in the app and on this page',
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
                  'If you have any questions or concerns about our privacy practices, feel free to contact us at:\n\n'
                  'Email: trodevit@gmail.com\n'
                  'Phone: +8801615257555\n',
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
