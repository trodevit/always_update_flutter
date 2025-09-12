// ignore_for_file: must_be_immutable

import 'package:always_update/assets_helper/app_colors.dart';
import 'package:always_update/assets_helper/app_fonts.dart';
import 'package:always_update/assets_helper/app_icons.dart';
import 'package:always_update/common_widgets/custom_appbar.dart';
import 'package:always_update/helpers/all_routes.dart';
import 'package:always_update/helpers/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SscAllPdfSubjectItemScreen extends StatefulWidget {
  dynamic type, classType;
  SscAllPdfSubjectItemScreen({super.key, this.type, this.classType});

  @override
  State<SscAllPdfSubjectItemScreen> createState() =>
      _SscAllPdfSubjectItemScreenState();
}

class _SscAllPdfSubjectItemScreenState
    extends State<SscAllPdfSubjectItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      appBar: CustomAppBar(
        title: 'পিডিএফ নোটস',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(
              16,
            ),
            child: GestureDetector(
              onTap: () {
                NavigationService.navigateTo(Routes.courseHomeScreen);
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColors.c02BF65,
                    width: 2,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(
                            8.0,
                          ),
                          child: SvgPicture.asset(
                            AppIcons.courseIcon,
                            height: 32.h,
                            width: 32.w,
                          ),
                        ),
                        Text(
                          'আমাদের কোর্স সমূহ',
                          style: TextFontStyle.hindisiliguri10w400.copyWith(
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: SvgPicture.asset(AppIcons.arrowNext),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
