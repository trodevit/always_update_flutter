// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:always_update/assets_helper/app_colors.dart';
import 'package:always_update/assets_helper/app_fonts.dart';
import 'package:always_update/assets_helper/app_icons.dart';
import 'package:always_update/common_widgets/custom_appbar.dart';
import 'package:always_update/helpers/all_routes.dart';
import 'package:always_update/helpers/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CourseDashboardScreen extends StatefulWidget {
  dynamic className, email, deviceID;
  CourseDashboardScreen({
    super.key,
    required this.className,
    required this.email,
    required this.deviceID,
  });

  @override
  State<CourseDashboardScreen> createState() => _CourseDashboardScreenState();
}

class _CourseDashboardScreenState extends State<CourseDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    
    log("################### Info Print #################");
    log("############# Class Name: ${widget.className}");
    log("############# Email: ${widget.email}");
    log("############# Device ID: ${widget.deviceID}");
    log("################################################");

    return Scaffold(
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
                      'আপনি আমাদের প্রিমিয়াম কোর্সে পাবেন ভিডিও টিউটোরিয়াল, সাজেশন এবং সর্ট-কাট ফর্মুলা',
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
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          NavigationService.navigateToWithArgs(
                            Routes.videoCourseListScreen,
                            {
                              'className': widget.className,
                              'type': 'video',
                              'email': widget.email,
                              'deviceID': widget.deviceID,
                            },
                          );
                          log('Navigating to Video Course List Screen');
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
                                'টিউটোরিয়াল',
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
                          NavigationService.navigateToWithArgs(
                              Routes.suggestionFormulaScreen, {
                            'className': widget.className,
                            'type': 'suggestion',
                            'email': widget.email,
                            'deviceID': widget.deviceID,
                          });
                          log('Navigating to Suggestion Screen');
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
                                'সাজেশন',
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
                          NavigationService.navigateToWithArgs(
                              Routes.suggestionFormulaScreen, {
                            'className': widget.className,
                            'type': 'suggestion',
                            'email': widget.email,
                            'deviceID': widget.deviceID,
                          });
                          log('Navigating to Suggestion Formula Screen');
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
                                'সর্ট-কাট ফর্মুলা',
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
