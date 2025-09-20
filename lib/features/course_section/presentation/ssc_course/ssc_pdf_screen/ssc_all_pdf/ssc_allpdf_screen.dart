import 'dart:developer';
import 'package:always_update/assets_helper/app_colors.dart';
import 'package:always_update/assets_helper/app_fonts.dart';
import 'package:always_update/assets_helper/app_images.dart';
import 'package:always_update/common_widgets/custom_appbar.dart';
import 'package:always_update/helpers/all_routes.dart';
import 'package:always_update/helpers/navigation_service.dart';
import 'package:always_update/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SscAllPdfScreen extends StatefulWidget {
  const SscAllPdfScreen({super.key});

  @override
  State<SscAllPdfScreen> createState() => _SscAllPdfScreenState();
}

class _SscAllPdfScreenState extends State<SscAllPdfScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      appBar: CustomAppBar(
        title: 'সকল পিডিএফ',
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
                      Routes.sscPDFCategoryScreen,
                      {'type': 'mcq'},
                    );
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
                          AppImages.pdfMcqImages,
                          width: 45.w,
                          height: 45.h,
                        ),
                        UIHelper.horizontalSpace(15.w),
                        Text(
                          'MCQ বোর্ড প্রশ্নোত্তর',
                          style: TextFontStyle.hindisiliguri10w400.copyWith(
                            color: AppColors.c000000,
                            fontSize: 20.sp,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                UIHelper.verticalSpace(16.h),
                GestureDetector(
                  onTap: () {
                    NavigationService.navigateToWithArgs(
                      Routes.sscPDFCategoryScreen,
                      {'type': 'short_question'},
                    );
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
                          AppImages.pdfShortQuestionImages,
                          width: 45.w,
                          height: 45.h,
                        ),
                        UIHelper.horizontalSpace(15.w),
                        Text(
                          'জ্ঞানমূলক প্রশ্নোত্তর',
                          style: TextFontStyle.hindisiliguri10w400.copyWith(
                            color: AppColors.c000000,
                            fontSize: 20.sp,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                UIHelper.verticalSpace(16.h),
                GestureDetector(
                  onTap: () {
                    NavigationService.navigateToWithArgs(
                      Routes.sscPDFCategoryScreen,
                      {'type': 'big_question'},
                    );
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
                          AppImages.groupSuggImage,
                          width: 45.w,
                          height: 45.h,
                        ),
                        UIHelper.horizontalSpace(15.w),
                        Text(
                          'সংক্ষিপ্ত প্রশ্নোত্তর',
                          style: TextFontStyle.hindisiliguri10w400.copyWith(
                            color: AppColors.c000000,
                            fontSize: 20.sp,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                UIHelper.verticalSpace(16.h),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Expanded(
                //       child: GestureDetector(
                //         onTap: () {
                //           NavigationService.navigateToWithArgs(
                //             Routes.sscPDFCategoryScreen,
                //             {'type': 'mcq'},
                //           );
                //           log('Navigating to SSC Group Subject Screen');
                //         },
                //         child: Container(
                //           height: 100,
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
                //                 AppIcons.courseIcon,
                //                 width: 40,
                //                 height: 40,
                //               ),
                //               Text(
                //                 'MCQ বোর্ড প্রশ্নোত্তর',
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
                //           NavigationService.navigateToWithArgs(
                //             Routes.sscPDFCategoryScreen,
                //             {'type': 'short_question'},
                //           );
                //           log('Navigating to SSC Shortcut Screen');
                //         },
                //         child: Container(
                //           height: 100,
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
                //                 AppIcons.courseIcon,
                //                 width: 40,
                //                 height: 40,
                //               ),
                //               Text(
                //                 'সংক্ষিপ্ত প্রশ্নোত্তর',
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
                //           NavigationService.navigateToWithArgs(
                //             Routes.sscPDFCategoryScreen,
                //             {'type': 'big_question'},
                //           );
                //           log('Navigating to SSC Shortcut Screen');
                //         },
                //         child: Container(
                //           height: 100,
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
                //                 AppIcons.courseIcon,
                //                 width: 40,
                //                 height: 40,
                //               ),
                //               Text(
                //                 'অনুধাবন প্রশ্নোত্তর',
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
