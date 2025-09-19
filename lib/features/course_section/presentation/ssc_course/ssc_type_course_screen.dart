import 'package:always_update/assets_helper/app_colors.dart';
import 'package:always_update/assets_helper/app_fonts.dart';
import 'package:always_update/assets_helper/app_images.dart';
import 'package:always_update/common_widgets/custom_appbar.dart';
import 'package:always_update/helpers/all_routes.dart';
import 'package:always_update/helpers/navigation_service.dart';
import 'package:always_update/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SscTypeCourseScreen extends StatefulWidget {
  const SscTypeCourseScreen({super.key});

  @override
  State<SscTypeCourseScreen> createState() => _SscTypeCourseScreenState();
}

class _SscTypeCourseScreenState extends State<SscTypeCourseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      appBar: CustomAppBar(
        title: 'আমার কোর্স',
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    NavigationService.navigateTo(
                      Routes.sscPdfLoginScreen,
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
                          'পিডিএফ কোর্স',
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
                      Routes.sscVideoLoginScreen,
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
                          'ভিডিও কোর্স',
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
                //       Routes.sscPdfLoginScreen,
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
                //             'পিডিএফ সেকশন',
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
                //     NavigationService.navigateTo(
                //       Routes.sscVideoLoginScreen,
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
