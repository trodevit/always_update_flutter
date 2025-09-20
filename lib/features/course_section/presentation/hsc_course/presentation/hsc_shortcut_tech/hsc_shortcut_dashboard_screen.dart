// ignore_for_file: must_be_immutable

import 'package:always_update/assets_helper/app_colors.dart';
import 'package:always_update/assets_helper/app_fonts.dart';
import 'package:always_update/assets_helper/app_images.dart';
import 'package:always_update/common_widgets/custom_appbar.dart';
import 'package:always_update/helpers/all_routes.dart';
import 'package:always_update/helpers/navigation_service.dart';
import 'package:always_update/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HscShortcutDashboardScreen extends StatefulWidget {
  dynamic yearID;
  HscShortcutDashboardScreen({super.key, this.yearID});

  @override
  State<HscShortcutDashboardScreen> createState() =>
      _HscShortcutDashboardScreenState();
}

class _HscShortcutDashboardScreenState
    extends State<HscShortcutDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      appBar: CustomAppBar(
        title: 'এইচএসসি শর্টকাট টেকনিক',
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
                        Routes.hscShortcutItemScreen, {
                      'yearID': widget.yearID,
                      'type': 'grammar',
                      'className': 'গ্রামার অংশ',
                    });
                  },
                  child: Container(
                    height: 80.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.grey.shade800,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        UIHelper.horizontalSpace(10.w),
                        Image.asset(
                          AppImages.writtenImage,
                          width: 45.w,
                          height: 45.h,
                        ),
                        UIHelper.horizontalSpace(15.w),
                        Text(
                          'গ্রামার অংশ',
                          style: TextFontStyle.hindisiliguri10w400.copyWith(
                            color: AppColors.c000000,
                            fontSize: 20.sp,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                UIHelper.verticalSpace(20.h),
                GestureDetector(
                  onTap: () {
                    NavigationService.navigateToWithArgs(
                        Routes.hscShortcutItemScreen, {
                      'yearID': widget.yearID,
                      'type': 'written',
                      'className': 'লিখিত অংশ',
                    });
                  },
                  child: Container(
                    height: 80.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.grey.shade800,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        UIHelper.horizontalSpace(10.w),
                        Image.asset(
                          AppImages.grammerImage,
                          width: 45.w,
                          height: 45.h,
                        ),
                        UIHelper.horizontalSpace(15.w),
                        Text(
                          'লিখিত অংশ',
                          style: TextFontStyle.hindisiliguri10w400.copyWith(
                            color: AppColors.c000000,
                            fontSize: 20.sp,
                          ),
                        )
                      ],
                    ),
                  ),
                ),

// * old code
                // // * HSC Group Based Suggestion
                // GestureDetector(
                //   onTap: () {
                //     NavigationService.navigateToWithArgs(
                //         Routes.hscShortcutItemScreen, {
                //       'yearID': widget.yearID,
                //       'type': 'grammar',
                //       'className': 'এইচএসসি',
                //     });
                //   },
                //   child: Container(
                //     width: double.infinity,
                //     decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.circular(8),
                //       border: Border.all(
                //         color: Colors.grey.shade800,
                //       ),
                //     ),
                //     child: Padding(
                //       padding: const EdgeInsets.all(16),
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.center,
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           SvgPicture.asset(
                //             AppIcons.ebookIcon,
                //             width: 40,
                //             height: 40,
                //           ),
                //           Text(
                //             'গ্রামার সেকশন',
                //             style: TextFontStyle.hindisiliguri10w400.copyWith(
                //               color: AppColors.c000000,
                //               fontSize: 16.sp,
                //               fontWeight: FontWeight.bold,
                //             ),
                //           )
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                // UIHelper.verticalSpace(20.h),
                // // * HSC MCQ
                // GestureDetector(
                //   onTap: () {
                //     NavigationService.navigateToWithArgs(
                //         Routes.hscShortcutItemScreen, {
                //       'yearID': widget.yearID,
                //       'type': 'written',
                //       'className': 'এইচএসসি',
                //     });
                //   },
                //   child: Container(
                //     width: double.infinity,
                //     decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.circular(8),
                //       border: Border.all(
                //         color: Colors.grey.shade800,
                //       ),
                //     ),
                //     child: Padding(
                //       padding: const EdgeInsets.all(16),
                //       child: Column(
                //         crossAxisAlignment: CrossAxisAlignment.center,
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           SvgPicture.asset(
                //             AppIcons.courseIcon,
                //             width: 40,
                //             height: 40,
                //           ),
                //           Text(
                //             'রিটেন সেকশন',
                //             style: TextFontStyle.hindisiliguri10w400.copyWith(
                //               color: AppColors.c000000,
                //               fontSize: 16.sp,
                //               fontWeight: FontWeight.bold,
                //             ),
                //           )
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                // UIHelper.verticalSpace(20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
