import 'dart:developer';
import 'package:always_update/assets_helper/app_colors.dart';
import 'package:always_update/assets_helper/app_fonts.dart';
import 'package:always_update/assets_helper/app_images.dart';
import 'package:always_update/common_widgets/custom_appbar.dart';
import 'package:always_update/features/course_section/presentation/ssc_course/ssc_pdf_screen/ssc_group_suggestion/ssc_group_subject_screen.dart';
import 'package:always_update/features/course_section/presentation/ssc_course/ssc_pdf_screen/ssc_shortcut_technique/ssc_shortcut_screen.dart';
import 'package:always_update/helpers/all_routes.dart';
import 'package:always_update/helpers/navigation_service.dart';
import 'package:always_update/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SscCategoryScreen extends StatefulWidget {
  const SscCategoryScreen({super.key});

  @override
  State<SscCategoryScreen> createState() => _SscCategoryScreenState();
}

class _SscCategoryScreenState extends State<SscCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      appBar: CustomAppBar(
        title: 'এসএসসি পিডিএফ কোর্স',
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
                    Get.to(() => SscGroupSubjectScreen());
                    log('Navigating to SSC Group Subject Screen');
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
                          AppImages.groupSuggImage,
                          width: 45.w,
                          height: 45.h,
                        ),
                        UIHelper.horizontalSpace(15.w),
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
                UIHelper.verticalSpaceMedium,
                GestureDetector(
                  onTap: () {
                    Get.to(() => SscShortcutScreen());
                    log('Navigating to SSC Shortcut Screen');
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
                UIHelper.verticalSpaceMedium,
                GestureDetector(
                  onTap: () {
                    NavigationService.navigateTo(
                      Routes.sscPDFScreen,
                    );
                    log('Navigating to SSC PDF Screen');
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
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Expanded(
                //       child: GestureDetector(
                //         onTap: () {
                //           Get.to(() => SscGroupSubjectScreen());
                //           log('Navigating to SSC Group Subject Screen');
                //         },
                //         child: Container(
                //           height: 100.h,
                //           decoration: BoxDecoration(
                //             color: Colors.white,
                //             borderRadius: BorderRadius.circular(8),
                //             border: Border.all(
                //               color: Colors.grey.shade800,
                //             ),
                //           ),
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.center,
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               SvgPicture.asset(
                //                 AppIcons.groupCourseIcon,
                //                 width: 40,
                //                 height: 40,
                //               ),
                //               Text(
                //                 'গ্রুপ সাজেশন',
                //                 style:
                //                     TextFontStyle.hindisiliguri10w400.copyWith(
                //                   color: AppColors.c000000,
                //                   fontSize: 16,
                //                 ),
                //               )
                //             ],
                //           ),
                //         ),
                //       ),
                //     ),
                //     SizedBox(
                //       width: 16,
                //     ),
                //     Expanded(
                //       child: GestureDetector(
                //         onTap: () {
                //           Get.to(() => SscShortcutScreen());
                //           log('Navigating to SSC Shortcut Screen');
                //         },
                //         child: Container(
                //           height: 100.h,
                //           decoration: BoxDecoration(
                //             color: Colors.white,
                //             borderRadius: BorderRadius.circular(8),
                //             border: Border.all(
                //               color: Colors.grey.shade800,
                //             ),
                //           ),
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.center,
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               Image.asset(
                //                 AppImages.groupShortCutImage,
                //                 width: 40.w,
                //                 height: 40.h,
                //               ),
                //               Text(
                //                 'শর্টকাট টেকনিক',
                //                 style:
                //                     TextFontStyle.hindisiliguri10w400.copyWith(
                //                   color: AppColors.c000000,
                //                   fontSize: 16,
                //                 ),
                //               )
                //             ],
                //           ),
                //         ),
                //       ),
                //     ),
                //     SizedBox(
                //       width: 16,
                //     ),
                //     Expanded(
                //       child: GestureDetector(
                //         onTap: () {
                //           NavigationService.navigateTo(
                //             Routes.sscPDFScreen,
                //           );
                //           log('Navigating to SSC PDF Screen');
                //         },
                //         child: Container(
                //           height: 100.h,
                //           decoration: BoxDecoration(
                //             color: Colors.white,
                //             borderRadius: BorderRadius.circular(8),
                //             border: Border.all(
                //               color: Colors.grey.shade800,
                //             ),
                //           ),
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.center,
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               Image.asset(
                //                 AppImages.pdfCourseImage,
                //                 width: 40.w,
                //                 height: 40.h,
                //               ),
                //               Text(
                //                 'পিডিএফ নোটস',
                //                 style:
                //                     TextFontStyle.hindisiliguri10w400.copyWith(
                //                   color: AppColors.c000000,
                //                   fontSize: 16,
                //                 ),
                //               )
                //             ],
                //           ),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
