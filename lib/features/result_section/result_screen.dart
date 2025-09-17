// import 'package:always_update/common_widgets/custom_appbar.dart';
// import 'package:always_update/networks/endpoints.dart' as EasyLauncher;
// import 'package:flutter/material.dart';
// import 'package:always_update/assets_helper/app_colors.dart';
// import 'package:always_update/assets_helper/app_fonts.dart';
// import 'package:always_update/assets_helper/app_icons.dart';
// import 'package:always_update/helpers/ui_helpers.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';

// class ResultScreen extends StatefulWidget {
//   const ResultScreen({super.key});

//   @override
//   State<ResultScreen> createState() => _ResultScreenState();
// }

// class _ResultScreenState extends State<ResultScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: CustomAppBar(title: 'রেজাল্ট দেখুন'),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.all(
//               16,
//             ),
//             child: Column(
//               children: [
//                 // * HSC Group Based Suggestion
//                 GestureDetector(
//                   onTap: () {},
//                   child: Container(
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(8),
//                       border: Border.all(
//                         color: Colors.grey.shade800,
//                       ),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(16),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           SvgPicture.asset(
//                             AppIcons.sscIcon,
//                             width: 40,
//                             height: 40,
//                           ),
//                           Text(
//                             'এসএসসি রেজাল্ট',
//                             style: TextFontStyle.hindisiliguri10w400.copyWith(
//                               color: AppColors.c000000,
//                               fontSize: 16.sp,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 UIHelper.verticalSpace(20.h),
//                 // * HSC MCQ
//                 GestureDetector(
//                   onTap: () {},
//                   child: Container(
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(8),
//                       border: Border.all(
//                         color: Colors.grey.shade800,
//                       ),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(16),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           SvgPicture.asset(
//                             AppIcons.hscIcon,
//                             width: 40,
//                             height: 40,
//                           ),
//                           Text(
//                             'এইচএসসি রেজাল্ট',
//                             style: TextFontStyle.hindisiliguri10w400.copyWith(
//                               color: AppColors.c000000,
//                               fontSize: 16.sp,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 UIHelper.verticalSpace(20.h),
//                 GestureDetector(
//                   onTap: () {},
//                   child: Container(
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(8),
//                       border: Border.all(
//                         color: Colors.grey.shade800,
//                       ),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(16),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           SvgPicture.asset(
//                             AppIcons.collegeAdmissionIcon,
//                             width: 40,
//                             height: 40,
//                           ),
//                           Text(
//                             'কলেজ ভর্তি রেজাল্ট',
//                             style: TextFontStyle.hindisiliguri10w400.copyWith(
//                               color: AppColors.c000000,
//                               fontSize: 16.sp,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 UIHelper.verticalSpace(20.h),

//                 GestureDetector(
//                   onTap: () async {
//                     await EasyLauncher.url(
//                         url: "https://www.instagram.com/qasim.dev",
//                         mode: Mode.platformDefault);
//                   },
//                   child: Container(
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(8),
//                       border: Border.all(
//                         color: Colors.grey.shade800,
//                       ),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(16),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           SvgPicture.asset(
//                             AppIcons.honoursIcon,
//                             width: 40,
//                             height: 40,
//                           ),
//                           Text(
//                             'অনার্স অ্যাডমিশন রেজাল্ট',
//                             style: TextFontStyle.hindisiliguri10w400.copyWith(
//                               color: AppColors.c000000,
//                               fontSize: 16.sp,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 UIHelper.verticalSpace(20.h),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:always_update/common_widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:always_update/assets_helper/app_colors.dart';
import 'package:always_update/assets_helper/app_fonts.dart';
import 'package:always_update/assets_helper/app_icons.dart';
import 'package:always_update/helpers/ui_helpers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: 'রেজাল্ট দেখুন'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // * SSC Result
                GestureDetector(
                  onTap: () {
                    _launchUrl("https://www.educationboardresults.gov.bd/");
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.grey.shade800,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AppIcons.sscIcon,
                            width: 40,
                            height: 40,
                          ),
                          Text(
                            'এসএসসি রেজাল্ট',
                            style: TextFontStyle.hindisiliguri10w400.copyWith(
                              color: AppColors.c000000,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                UIHelper.verticalSpace(20.h),
                // * HSC Result
                GestureDetector(
                  onTap: () {
                    _launchUrl("https://www.educationboardresults.gov.bd/");
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.grey.shade800,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AppIcons.hscIcon,
                            width: 40,
                            height: 40,
                          ),
                          Text(
                            'এইচএসসি রেজাল্ট',
                            style: TextFontStyle.hindisiliguri10w400.copyWith(
                              color: AppColors.c000000,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                UIHelper.verticalSpace(20.h),
                // * College Admission Result
                GestureDetector(
                  onTap: () {
                    _launchUrl("http://xiclassadmission.gov.bd/");
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.grey.shade800,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AppIcons.collegeAdmissionIcon,
                            width: 40,
                            height: 40,
                          ),
                          Text(
                            'কলেজ ভর্তি রেজাল্ট',
                            style: TextFontStyle.hindisiliguri10w400.copyWith(
                              color: AppColors.c000000,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                UIHelper.verticalSpace(20.h),
                // * Honours Admission Result
                GestureDetector(
                  onTap: () {
                    _launchUrl(
                        "http://app55.nu.edu.bd/nu-web/admissionTestResultQueryForm");
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.grey.shade800,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AppIcons.honoursIcon,
                            width: 40,
                            height: 40,
                          ),
                          Text(
                            'অনার্স অ্যাডমিশন রেজাল্ট',
                            style: TextFontStyle.hindisiliguri10w400.copyWith(
                              color: AppColors.c000000,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                UIHelper.verticalSpace(20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
