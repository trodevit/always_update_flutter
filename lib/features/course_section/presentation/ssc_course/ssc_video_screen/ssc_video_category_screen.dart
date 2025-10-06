import 'package:always_update/assets_helper/app_colors.dart';
import 'package:always_update/assets_helper/app_fonts.dart';
import 'package:always_update/assets_helper/app_images.dart';
import 'package:always_update/common_widgets/custom_appbar.dart';
import 'package:always_update/helpers/all_routes.dart';
import 'package:always_update/helpers/navigation_service.dart';
import 'package:always_update/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SscVideoCategoryScreen extends StatefulWidget {
  const SscVideoCategoryScreen({super.key});

  @override
  State<SscVideoCategoryScreen> createState() => _SscVideoCategoryScreenState();
}

class _SscVideoCategoryScreenState extends State<SscVideoCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      appBar: CustomAppBar(
        title: 'এসএসসি ভিডিও কোর্স',
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
                      Routes.sscGroupSuggestionScreen,
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
                          AppImages.groupNewImage,
                          width: 55.w,
                          height: 55.h,
                        ),
                        UIHelper.horizontalSpace(5.w),
                        Text(
                          'গ্রুপভিত্তিক সাজেশন',
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
                      Routes.sscVideoShortcutScreen,
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
                          AppImages.groupShortCutImage,
                          width: 45.w,
                          height: 45.h,
                        ),
                        UIHelper.horizontalSpace(15.w),
                        Text(
                          'শর্টকাট টেকনিক',
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
                      Routes.sscVideoSubjectScreen,
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
                          AppImages.videoImage,
                          width: 45.w,
                          height: 45.h,
                        ),
                        UIHelper.horizontalSpace(15.w),
                        Text(
                          'ভিডিও ক্লাস',
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
                      Routes.sscPDFScreen,
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
                          AppImages.pdfCourseImage,
                          width: 45.w,
                          height: 45.h,
                        ),
                        UIHelper.horizontalSpace(15.w),
                        Text(
                          'সকল পিডিএফ',
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
                // GestureDetector(
                //   onTap: () {
                //     NavigationService.navigateTo(
                //       Routes.sscGroupSuggestionScreen,
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
                //             'গ্রুপ সাজেশন',
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
                //     NavigationService.navigateTo(
                //       Routes.sscVideoShortcutScreen,
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
                //             'শর্টকাট সেকশন',
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
