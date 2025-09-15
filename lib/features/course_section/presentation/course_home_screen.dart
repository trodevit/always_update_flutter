import 'dart:developer';
import 'package:always_update/assets_helper/app_colors.dart';
import 'package:always_update/assets_helper/app_fonts.dart';
import 'package:always_update/assets_helper/app_icons.dart';
import 'package:always_update/common_widgets/custom_appbar.dart';
import 'package:always_update/helpers/all_routes.dart';
import 'package:always_update/helpers/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CourseHomeScreen extends StatefulWidget {
  const CourseHomeScreen({super.key});

  @override
  State<CourseHomeScreen> createState() => _CourseHomeScreenState();
}

class _CourseHomeScreenState extends State<CourseHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFFFFFF,
      appBar: CustomAppBar(
        title: 'আমার কোর্স',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(
              16,
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.boxShadow,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: AppColors.boxShadow,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'আপনি যদি আমাদের এই প্রিমিয়াম কোর্সগুলোর মধ্যে থেকে কিছু শিখতে চান, তাহলে আমাদের কোর্সে এনরোল করুন, কোর্স কিনতে আমাদের সাথে যোগাযোগ করুন whatsapp নাম্বারে।',
                      style: TextFontStyle.hindisiliguri10w400.copyWith(
                        color: AppColors.cFFFFFF,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          // Get.to(() =>
                          //     SscCategoryScreen()); // Pass the widget directly
                          NavigationService.navigateTo(
                            Routes.sscTypeCategoryScreen,
                          );
                        },
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.grey.shade800,
                            ),
                          ),
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
                                'এসএসসি কোর্স',
                                style:
                                    TextFontStyle.hindisiliguri10w400.copyWith(
                                  color: AppColors.c000000,
                                  fontSize: 16,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          NavigationService.navigateTo(
                            Routes.hscDashboardScreen,
                          );
                          log('Navigating to HSC Dashboard Screen');
                        },
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.grey.shade800,
                            ),
                          ),
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
                                'এইচএসসি কোর্স',
                                style:
                                    TextFontStyle.hindisiliguri10w400.copyWith(
                                  color: AppColors.c000000,
                                  fontSize: 16,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          NavigationService.navigateTo(
                            Routes.honoursDashboardScreen,
                          );
                          log('Navigating to Honours Dashboard Screen');
                        },
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.grey.shade800,
                            ),
                          ),
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
                                'অনার্স কোর্স',
                                style:
                                    TextFontStyle.hindisiliguri10w400.copyWith(
                                  color: AppColors.c000000,
                                  fontSize: 16,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
