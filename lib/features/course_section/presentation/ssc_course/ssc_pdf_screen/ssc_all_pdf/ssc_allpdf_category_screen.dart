// ignore_for_file: must_be_immutable
import 'package:always_update/assets_helper/app_colors.dart';
import 'package:always_update/assets_helper/app_fonts.dart';
import 'package:always_update/assets_helper/app_images.dart';
import 'package:always_update/common_widgets/custom_appbar.dart';
import 'package:always_update/helpers/all_routes.dart';
import 'package:always_update/helpers/navigation_service.dart';
import 'package:always_update/helpers/toast.dart';
import 'package:always_update/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SscAllPdfCategoryScreen extends StatefulWidget {
  dynamic type;
  SscAllPdfCategoryScreen({super.key, this.type});

  @override
  State<SscAllPdfCategoryScreen> createState() =>
      _SscAllPdfCategoryScreenState();
}

class _SscAllPdfCategoryScreenState extends State<SscAllPdfCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      appBar: CustomAppBar(
        title: 'বিভাগ নির্বাচন করুন',
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
                      Routes.sscAllPdfSubjectItemScreen,
                      {'type': widget.type, 'classType': 'science'},
                    );
                    ToastUtil.showShortToast(
                      'Navigating to ${widget.type} -> Science -> ALL PDF List',
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
                          AppImages.groupScienceImage,
                          width: 45.w,
                          height: 45.h,
                        ),
                        UIHelper.horizontalSpace(15.w),
                        Text(
                          'বিজ্ঞান বিভাগ',
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
                      Routes.sscAllPdfSubjectItemScreen,
                      {'type': widget.type, 'classType': 'commerce'},
                    );
                    ToastUtil.showShortToast(
                      'Navigating to ${widget.type} -> Commerce -> ALL PDF List',
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
                          AppImages.groupBusinessImage,
                          width: 45.w,
                          height: 45.h,
                        ),
                        UIHelper.horizontalSpace(15.w),
                        Text(
                          'ব্যবসায় বিভাগ',
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
                      Routes.sscAllPdfSubjectItemScreen,
                      {'type': widget.type, 'classType': 'arts'},
                    );
                    ToastUtil.showShortToast(
                      'Navigating to ${widget.type} -> Arts -> ALL PDF List',
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
                          AppImages.manobikImage,
                          width: 55.w,
                          height: 55.h,
                        ),
                        UIHelper.horizontalSpace(7.w),
                        Text(
                          'মানবিক বিভাগ',
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
                //           // Get.to(() => SscGroupSubjectScreen());
                //           NavigationService.navigateToWithArgs(
                //             Routes.sscAllPdfSubjectItemScreen,
                //             {'type': widget.type, 'classType': 'science'},
                //           );
                //           ToastUtil.showShortToast(
                //             'Navigating to ${widget.type} -> Science -> ALL PDF List',
                //           );
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
                //                 'বিজ্ঞান বিভাগ',
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
                //             Routes.sscAllPdfSubjectItemScreen,
                //             {'type': widget.type, 'classType': 'arts'},
                //           );
                //           ToastUtil.showShortToast(
                //             'Navigating to ${widget.type} -> Arts -> ALL PDF List',
                //           );
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
                //                 'মানবিক বিভাগ',
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
                //             Routes.sscAllPdfSubjectItemScreen,
                //             {'type': widget.type, 'classType': 'commerce'},
                //           );
                //           ToastUtil.showShortToast(
                //             'Navigating to ${widget.type} -> Commerce -> ALL PDF List',
                //           );
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
                //                 'ব্যবসায় বিভাগ',
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
