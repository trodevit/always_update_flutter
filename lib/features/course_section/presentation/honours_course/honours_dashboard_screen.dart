import 'package:always_update/assets_helper/app_colors.dart';
import 'package:always_update/assets_helper/app_fonts.dart';
import 'package:always_update/assets_helper/app_images.dart';
import 'package:always_update/common_widgets/custom_appbar.dart';
import 'package:always_update/helpers/all_routes.dart';
import 'package:always_update/helpers/navigation_service.dart';
import 'package:always_update/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HonoursDashboardScreen extends StatefulWidget {
  const HonoursDashboardScreen({super.key});

  @override
  State<HonoursDashboardScreen> createState() => _HonoursDashboardScreenState();
}

class _HonoursDashboardScreenState extends State<HonoursDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      appBar: CustomAppBar(
        title: 'অনার্স কোর্স',
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
                    NavigationService.navigateTo(
                      Routes.honoursGroupDashboardScreen,
                    );
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
                        UIHelper.horizontalSpace(5.w),
                        Image.asset(
                          AppImages.groupNewImage,
                          width: 55.w,
                          height: 55.h,
                        ),
                        UIHelper.horizontalSpace(7.w),
                        Text(
                          'গ্রুপ ভিত্তিক সাজেশন',
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
                    NavigationService.navigateTo(
                      Routes.honoursMCQDashboardScreen,
                    );
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
                          AppImages.pdfMcqImages,
                          width: 45.w,
                          height: 45.h,
                        ),
                        UIHelper.horizontalSpace(15.w),
                        Text(
                          'এমসিকিউ প্রশ্নোত্তর',
                          style: TextFontStyle.hindisiliguri10w400.copyWith(
                            color: AppColors.c000000,
                            fontSize: 20.sp,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
// * Old Code
                // GestureDetector(
                //   onTap: () {
                //     // NavigationService.navigateTo(
                //     //   Routes.honoursGroupDashboardScreen,
                //     // );
                //     NavigationService.navigateTo(
                //       Routes.honoursGroupLoginScreen,
                //     );
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
                //             'গ্রুপ ভিত্তিক সাজেশন',
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
                // GestureDetector(
                //   onTap: () {
                //     // Get.to(() =>
                //     //     SscCategoryScreen()); // Pass the widget directly
                //     // NavigationService.navigateTo(
                //     //   Routes.honoursMCQDashboardScreen,
                //     // );
                //     NavigationService.navigateTo(
                //       Routes.honoursMCQLoginScreen,
                //     );
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
                //             'এমসিকিউ প্রশ্নোত্তর',
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

// * #####################
                // UIHelper.verticalSpace(20.h),
                // GestureDetector(
                //   onTap: () {
                //     // Get.to(() =>
                //     //     SscCategoryScreen()); // Pass the widget directly
                //     NavigationService.navigateTo(
                //       Routes.sscVideoSubjectScreen,
                //     );
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
                //             'ভিডিও সেকশন',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
