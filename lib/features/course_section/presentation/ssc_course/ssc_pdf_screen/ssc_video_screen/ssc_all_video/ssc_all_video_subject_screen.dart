import 'package:always_update/assets_helper/app_colors.dart';
import 'package:always_update/assets_helper/app_fonts.dart';
import 'package:always_update/assets_helper/app_icons.dart';
import 'package:always_update/common_widgets/custom_appbar.dart';
import 'package:always_update/helpers/all_routes.dart';
import 'package:always_update/helpers/navigation_service.dart';
import 'package:always_update/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SscVideoSubjectScreen extends StatefulWidget {
  const SscVideoSubjectScreen({super.key});

  @override
  State<SscVideoSubjectScreen> createState() => _SscVideoSubjectScreenState();
}

class _SscVideoSubjectScreenState extends State<SscVideoSubjectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      appBar: CustomAppBar(
        title: 'এসএসসি ভিডিও',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(
              16,
            ),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    NavigationService.navigateToWithArgs(
                        Routes.sscVideoSubjectListScreen, {
                      'type': 'science',
                      'classType': 'বিজ্ঞান বিভাগ',
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.grey.shade800,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AppIcons.ebookIcon,
                            width: 40,
                            height: 40,
                          ),
                          Text(
                            'বিজ্ঞান বিভাগ',
                            style: TextFontStyle.hindisiliguri10w400.copyWith(
                              color: AppColors.c000000,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                UIHelper.verticalSpace(20.h),
                GestureDetector(
                  onTap: () {
                    // Get.to(() =>
                    //     SscCategoryScreen()); // Pass the widget directly
                    NavigationService.navigateToWithArgs(
                        Routes.sscVideoSubjectListScreen, {
                      'type': 'commerce',
                      'classType': 'ব্যবসায় বিভাগ',
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.grey.shade800,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AppIcons.courseIcon,
                            width: 40,
                            height: 40,
                          ),
                          Text(
                            'ব্যবসায় বিভাগ',
                            style: TextFontStyle.hindisiliguri10w400.copyWith(
                              color: AppColors.c000000,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                UIHelper.verticalSpace(20.h),
                GestureDetector(
                  onTap: () {
                    // Get.to(() =>
                    //     SscCategoryScreen()); // Pass the widget directly
                    NavigationService.navigateToWithArgs(
                        Routes.sscVideoSubjectListScreen, {
                      'type': 'arts',
                      'classType': 'মানবিক বিভাগ',
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.grey.shade800,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AppIcons.courseIcon,
                            width: 40,
                            height: 40,
                          ),
                          Text(
                            'মানবিক বিভাগ',
                            style: TextFontStyle.hindisiliguri10w400.copyWith(
                              color: AppColors.c000000,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
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
