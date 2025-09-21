// ignore_for_file: must_be_immutable, prefer_const_constructors_in_immutables, deprecated_member_use, no_leading_underscores_for_local_identifiers
import 'dart:developer';

import 'package:always_update/assets_helper/app_colors.dart';
import 'package:always_update/assets_helper/app_fonts.dart';
import 'package:always_update/assets_helper/app_icons.dart';
import 'package:always_update/common_widgets/custom_appbar.dart';
import 'package:always_update/helpers/all_routes.dart';
import 'package:always_update/helpers/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ClassSecreen extends StatefulWidget {
  dynamic className;
  ClassSecreen({
    super.key,
    this.className,
  });

  @override
  State<ClassSecreen> createState() => _ClassSecreenState();
}

class _ClassSecreenState extends State<ClassSecreen> {
  @override
  Widget build(BuildContext context) {
    // String formattedDate(String dateString) {
    //   try {
    //     DateTime dateTime = DateTime.parse(dateString);
    //     return DateFormat('d MMMM yyyy').format(dateTime);
    //   } catch (e) {
    //     return '';
    //   }
    // }

    log("============> ${widget.className}");

    String _bnTitle(dynamic className) {
      final key = (className ?? '').toString().toLowerCase().trim();
      switch (key) {
        case 'ssc':
          return 'এসএসসি';
        case 'hsc':
          return 'এইচএসসি';
        case 'honours':
          return 'অনার্স';
        case 'collegeadmission':
          return 'কলেজ এডমিশন';
        default:
          // fallback: jeta asche oita-i dekhabe
          return (className ?? '').toString();
      }
    }

    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      appBar: CustomAppBar(
        title: '${_bnTitle(widget.className)} সাহায্য কেন্দ্র',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(
              16,
            ),
            child: Column(
              children: [
                if (widget.className != 'collegeadmission')
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          NavigationService.navigateToWithArgs(
                            Routes.classTopicScreen,
                            {
                              'type': 'suggestion',
                              'className': widget.className,
                            },
                          );
                        },
                        child: Container(
                          height: 110.h,
                          width: 150.w,
                          decoration: BoxDecoration(
                            color: AppColors.c15803D,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  AppIcons.sscIcon,
                                  color: AppColors.white,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'সাজেশন',
                                  style: TextFontStyle.hindisiliguri10w400
                                      .copyWith(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  'সকল বিষয়ের গুরুত্বপূর্ণ সাজেশন',
                                  style: TextFontStyle.hindisiliguri10w400
                                      .copyWith(
                                    color: Colors.white,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          NavigationService.navigateToWithArgs(
                            Routes.classTopicScreen,
                            {
                              'type': 'result',
                              'className': widget.className,
                            },
                          );
                        },
                        child: Container(
                          height: 110.h,
                          width: 150.w,
                          decoration: BoxDecoration(
                            color: AppColors.c1E40AF,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  AppIcons.trophyIcon,
                                  color: AppColors.white,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'রেজাল্ট',
                                  style: TextFontStyle.hindisiliguri10w400
                                      .copyWith(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  'রেজাল্ট বিষয়ক সকল তথ্য',
                                  style: TextFontStyle.hindisiliguri10w400
                                      .copyWith(
                                    color: Colors.white,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                if (widget.className != 'collegeadmission')
                  SizedBox(height: 20),
                if (widget.className != 'collegeadmission')
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          NavigationService.navigateToWithArgs(
                            Routes.classTopicScreen,
                            {
                              'type': 'scholarship',
                              'className': widget.className,
                            },
                          );
                        },
                        child: Container(
                          height: 110.h,
                          width: 150.w,
                          decoration: BoxDecoration(
                            color: AppColors.cDB2777,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  AppIcons.takaIcon,
                                  color: AppColors.white,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'উপবৃত্তি',
                                  style: TextFontStyle.hindisiliguri10w400
                                      .copyWith(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  'সকল উপবৃত্তির তথ্য',
                                  style: TextFontStyle.hindisiliguri10w400
                                      .copyWith(
                                    color: Colors.white,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          NavigationService.navigateToWithArgs(
                            Routes.classTopicScreen,
                            {
                              'type': 'notice',
                              'className': widget.className,
                            },
                          );
                        },
                        child: Container(
                          height: 110.h,
                          width: 150.w,
                          decoration: BoxDecoration(
                            color: AppColors.cEA580C,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  AppIcons.noticeIcon,
                                  color: AppColors.white,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'নোটিশ',
                                  style: TextFontStyle.hindisiliguri10w400
                                      .copyWith(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  'গুরুত্বপূর্ণ সকল নোটিশ',
                                  style: TextFontStyle.hindisiliguri10w400
                                      .copyWith(
                                    color: Colors.white,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                if (widget.className == 'collegeadmission')
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          NavigationService.navigateToWithArgs(
                            Routes.classTopicScreen,
                            {
                              'type': 'result',
                              'className': widget.className,
                              'shortText': 'রেজাল্ট বিষয়ক সকল তথ্য',
                            },
                          );
                        },
                        child: Container(
                          height: 110.h,
                          width: 150.w,
                          decoration: BoxDecoration(
                            color: AppColors.c1E40AF,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  AppIcons.trophyIcon,
                                  color: AppColors.white,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'রেজাল্ট',
                                  style: TextFontStyle.hindisiliguri10w400
                                      .copyWith(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  'রেজাল্ট বিষয়ক সকল তথ্য',
                                  style: TextFontStyle.hindisiliguri10w400
                                      .copyWith(
                                    color: Colors.white,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          NavigationService.navigateToWithArgs(
                            Routes.classTopicScreen,
                            {
                              'type': 'notice',
                              'className': widget.className,
                              'shortText': 'গুরুত্বপূর্ণ সকল নোটিশ',
                            },
                          );
                        },
                        child: Container(
                          height: 110.h,
                          width: 150.w,
                          decoration: BoxDecoration(
                            color: AppColors.cEA580C,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  AppIcons.noticeIcon,
                                  color: AppColors.white,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'নোটিশ',
                                  style: TextFontStyle.hindisiliguri10w400
                                      .copyWith(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  'গুরুত্বপূর্ণ সকল নোটিশ',
                                  style: TextFontStyle.hindisiliguri10w400
                                      .copyWith(
                                    color: Colors.white,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                // SizedBox(height: 20),
                // Align(
                //   alignment: Alignment.centerLeft,
                //   child: Text(
                //     'সাম্প্রতিক নোটিশ',
                //     style: TextFontStyle.hindisiliguri10w400.copyWith(
                //       color: Colors.black,
                //       fontSize: 18,
                //       fontWeight: FontWeight.w700,
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
