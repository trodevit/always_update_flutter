// ignore_for_file: must_be_immutable

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

class HscGroupSuggScreen extends StatefulWidget {
  dynamic yearID;
  HscGroupSuggScreen({super.key, this.yearID});

  @override
  State<HscGroupSuggScreen> createState() => _HscGroupSuggScreenState();
}

class _HscGroupSuggScreenState extends State<HscGroupSuggScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      appBar: CustomAppBar(
        title: 'এইচএসসি গ্রুপ ভিত্তিক সাজেশন',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(
              16,
            ),
            child: Column(
              children: [
                // * HSC Group Based Suggestion
                GestureDetector(
                  onTap: () {
                    NavigationService.navigateToWithArgs(
                        Routes.hscGroupSuggItemScreen, {
                      'yearID': widget.yearID,
                      'className': 'science',
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
                // * HSC MCQ
                GestureDetector(
                  onTap: () {
                    NavigationService.navigateToWithArgs(
                        Routes.hscGroupSuggItemScreen, {
                      'yearID': widget.yearID,
                      'className': 'commerce',
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
                UIHelper.verticalSpace(20.h),
                // * HSC Video Section
                GestureDetector(
                  onTap: () {
                    NavigationService.navigateToWithArgs(
                        Routes.hscGroupSuggItemScreen, {
                      'yearID': widget.yearID,
                      'className': 'arts',
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
                            'ব্যবসায় বিভাগ',
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
